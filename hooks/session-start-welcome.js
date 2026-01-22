/**
 * Gemini Elite Core - Session Start Welcome Hook
 * Optimized for Gemini CLI v0.27.0+ (Nightly)
 */

const cyan = '\x1b[36m';
const reset = '\x1b[0m';
const magenta = '\x1b[35m';
const yellow = '\x1b[33m';

function logToUser(message) {
  // Use stderr for UI messages to avoid breaking JSON parsing on stdout
  process.stderr.write(message + '\n');
}

async function main() {
  // 1. Visual UI Message (displayed to user)
  logToUser(`\n${cyan}🚀 Gemini Elite Core v5.6 - Nightly Intelligence Active${reset}`);
  logToUser(`${magenta}Protocols: Generalist-Orchestration, Skill-Mastery, Planning-Guardian.${reset}`);
  logToUser(`${cyan}Status: Sensory Stack Ready | Agents: Generalist + Specialists (Active)${reset}\n`);

  // 2. Performance & Capability Check
  try {
    const { spawnSync } = await import('node:child_process');
    const bunCheck = spawnSync('bun', ['--version'], { encoding: 'utf8' });
    
    if (bunCheck.status !== 0) {
      logToUser(`${yellow}⚠️  Warning: Bun not detected. Standard Node.js used (lower performance).${reset}`);
    } else {
      logToUser(`${cyan}✓ Bun ${bunCheck.stdout.trim()} detected (Elite Performance Mode)${reset}`);
    }
  } catch (e) {
    // Silently fail if process check fails
  }

  // 3. System Message for Gemini (Injected into context)
  const response = {
    systemMessage: "Gemini Elite Core v5.6 initialized. You are now operating in 'Generalist Mode'. For complex tasks, you MUST use 'delegate_to_agent' or invoke specialists like @codebaseInvestigator. Always activate relevant skills using 'activate_skill' before starting any logic changes."
  };

  // The ONLY thing on stdout must be the JSON
  process.stdout.write(JSON.stringify(response));
}

main().catch((err) => {
  // On error, still try to return a valid (though empty) JSON to avoid CLI warnings
  process.stdout.write(JSON.stringify({}));
  process.exit(0);
});
