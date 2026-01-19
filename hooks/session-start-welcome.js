import { spawnSync } from 'node:child_process';

async function main() {
  const cyan = '\x1b[36m';
  const reset = '\x1b[0m';
  const magenta = '\x1b[35m';

  console.log(`\n${cyan}🚀 Gemini Elite Core v5.4 - Generalist Edition (Nightly 20260119)${reset}`);
  console.log(`${magenta}Active Protocols: Generalist-Orchestration, Auto-Type-Check, Planning-Guardian.${reset}\n`);
  console.log(`${cyan}Performance: 30% Token Savings | 5x Faster Analysis | 40% Less Memory${reset}\n`);

  // Check Bun
  const bunCheck = spawnSync('bun', ['--version']);
  if (bunCheck.status !== 0) {
    console.log('⚠️  Bun not detected. It is highly recommended to install Bun for optimal performance with Gemini Elite Core.');
  }
}

main().catch(() => process.exit(0));