import { spawnSync } from 'node:child_process';
import { readFileSync, existsSync } from 'node:fs';
import { join } from 'node:path';

async function main() {
  const input = JSON.parse(readFileSync(0, 'utf8'));
  const { tool_name, cwd, hook_event_name } = input;

  // Only act on AfterTool for tools that modify files
  const modifyingTools = ['write_file', 'replace', 'run_shell_command'];
  if (hook_event_name !== 'AfterTool' || !modifyingTools.includes(tool_name)) {
    return;
  }

  // Check if it's a TypeScript project
  const tsconfigPath = join(cwd, 'tsconfig.json');
  if (!existsSync(tsconfigPath)) {
    return;
  }

  // Execute Type Check
  const result = spawnSync('bun', ['x', 'tsc', '--noEmit'], {
    cwd,
    encoding: 'utf8',
  });

  let systemMessage = '';

  if (result.status !== 0) {
    systemMessage += `⚠️ [Gemini Elite Protocol] Type errors detected after the last change:\n\n${result.stdout || result.stderr}\n\nPlease fix these errors before proceeding.\n`;
  }

  // Modularity Guardrail: Check line counts of modified files
  const gitStatus = spawnSync('git', ['status', '--porcelain'], { cwd, encoding: 'utf8' });
  const modifiedFiles = gitStatus.stdout
    .split('\n')
    .map(line => line.slice(3).trim())
    .filter(file => file.endsWith('.ts') || file.endsWith('.tsx') || file.endsWith('.md') || file.endsWith('.skill'));

  for (const file of modifiedFiles) {
    const filePath = join(cwd, file);
    if (existsSync(filePath)) {
      const content = readFileSync(filePath, 'utf8');
      const lineCount = content.split('\n').length;
      if (lineCount > 500) {
        systemMessage += `\n📏 [Modularity Guardrail] File "${file}" has ${lineCount} lines. This exceeds the 500-line Elite Standard. Please consider refactoring or splitting it to maintain optimal agent performance.\n`;
      }
    }
  }

  if (systemMessage) {
    // In v0.27.0, exit code 2 triggers a System Block/Retry
    // This forces the agent to fix the type errors before continuing
    process.stderr.write(`<hook_context>\n${systemMessage}\n</hook_context>`);
    process.exit(2);
  }
}

main().catch(() => process.exit(0));