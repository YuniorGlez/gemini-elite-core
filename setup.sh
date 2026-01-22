#!/bin/bash

# Gemini Elite Core Setup Script - v5.5 "Skill Mastery Edition"
# Optimized for Gemini CLI v0.26.0+ (Nightly 20260119)
# CLI + Skills + Generalist Agent + Planning Policies

set -e

# Visual constants
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
MAGENTA='\033[0;35m'
BLUE='\033[0;34m'
NC='\033[0m'

# Helpers
info() { echo -e "${BLUE}info${NC} $1"; }
success() { echo -e "${GREEN}success${NC} $1"; }
warn() { echo -e "${YELLOW}warn${NC} $1"; }
step() { echo -e "\n${CYAN}🚀 $1${NC}"; }

# Language Selection
clear
echo -e "${MAGENTA}Select Language / Selecciona Idioma:${NC}"
echo -e "1) English (Default)"
echo -e "2) Español"
echo -n "Selection / Selección [1]: "
read -r LANG_CHOICE

if [[ "$LANG_CHOICE" == "2" ]]; then
    SELECTED_LANG="ES"
else
    SELECTED_LANG="EN"
fi

# Translations
if [[ "$SELECTED_LANG" == "ES" ]]; then
    MSG_TITLE="Gemini Elite Core v5.5"
    MSG_SUBTITLE="La suite de aprovisionamiento inteligente (Skill Mastery Update)"
    MSG_STEP_CHECK_CLI="Comprobando Gemini CLI..."
    MSG_WARN_CLI_NOT_FOUND="Gemini CLI no detectado. Instalando versión @nightly..."
    MSG_SUCCESS_CLI_INSTALLED="Gemini CLI instalado."
    MSG_SUCCESS_CLI_DETECTED="Gemini CLI detectado."
    MSG_SEC_CONFIG="Configuración de Seguridad:"
    MSG_ENTER_API_KEY="Introduce tu Gemini API Key (o pulsa Enter para omitir): "
    MSG_SAVE_PERM="¿Guardar permanentemente en la configuración de tu shell? (s/n): "
    MSG_SUCCESS_KEY_SAVED="API Key guardada en"
    MSG_STEP_SYNC_SETTINGS="Sincronizando Configuración..."
    MSG_SUCCESS_SETTINGS_CREATED="settings.json inicial creado."
    MSG_INFO_MERGE_AGENTS="Fusionando configuración de agentes..."
    MSG_SUCCESS_SETTINGS_MERGED="Configuración fusionada."
    MSG_STEP_CONFIG_MCP="Configurando MCPs sensoriales base..."
    MSG_SUCCESS_MCP_READY="Stack sensorial MCP listo."
    MSG_STEP_INST_SKILLS="Instalando Habilidades Tácticas..."
    MSG_INFO_DEPLOYING="Desplegando"
    MSG_SUCCESS_SKILLS_DEPLOYED="Habilidades tácticas desplegadas."
    MSG_STEP_CONFIG_HOOKS="Configurando Protocol Hooks..."
    MSG_SUCCESS_HOOKS_ACTIVE="Protocol Hooks activos."
    MSG_STEP_ADOPT_PROTOCOLS="Adopción de Protocolos Agénticos"
    MSG_PROTOCOLS_DESC="Los protocolos Elite Core imponen flujos de trabajo específicos:"
    MSG_PROTO_1="Auto-Type-Check: Ejecuta 'tsc --noEmit' tras cambios y antes del build."
    MSG_PROTO_2="Commit-Sentinel: Propone commits pero NUNCA auto-commitea (Confirmación manual)."
    MSG_PROTO_3="Skill Mastery (CRÍTICO): DEBO activar TODAS las skills relevantes (\`activate_skill\`) al inicio de cada tarea."
    MSG_PROTO_4="Bun & DB: Uso exclusivo de Bun y migraciones (001...) con verificación de constraints."
    MSG_PROMPT_ADOPT="\n¿Quieres adoptar estos protocolos Elite Core en tu GEMINI.md global? [S/n]: "
    MSG_SUCCESS_GEMINI_MD="GEMINI.md global actualizado con protocolos Elite Core."
    MSG_INFO_SKIP_GEMINI="Omitiendo actualización de GEMINI.md. Aún puedes usar las habilidades manualmente."
    MSG_FINISH="¡Aprovisionamiento de Gemini Elite Core completado!"
    MSG_STATUS_CLI="CLI: Nightly (v0.26.0-nightly.20260119)"
    MSG_STATUS_AGENTS="Agentes: Generalist + Especialistas (Activos)"
    MSG_STATUS_PLANNING="Planificación: Habilitada (Experimental)"
    MSG_STATUS_SKILLS="Habilidades: Desplegadas (25+ MDs Tácticos)"
    MSG_STATUS_HOOKS="Hooks: Monitoreo activo"
    YES_REGEX="^[Ss]?$"
else
    MSG_TITLE="Gemini Elite Core v5.5"
    MSG_SUBTITLE="The Intelligent Provisioning Suite (Skill Mastery Update)"
    MSG_STEP_CHECK_CLI="Checking Gemini CLI..."
    MSG_WARN_CLI_NOT_FOUND="Gemini CLI not detected. Installing @nightly version..."
    MSG_SUCCESS_CLI_INSTALLED="Gemini CLI installed."
    MSG_SUCCESS_CLI_DETECTED="Gemini CLI detected."
    MSG_SEC_CONFIG="Security Configuration:"
    MSG_ENTER_API_KEY="Enter your Gemini API Key (or press Enter to skip): "
    MSG_SAVE_PERM="Save permanently in your shell config? (y/n): "
    MSG_SUCCESS_KEY_SAVED="API Key saved to"
    MSG_STEP_SYNC_SETTINGS="Synchronizing Settings..."
    MSG_SUCCESS_SETTINGS_CREATED="Initial settings.json created."
    MSG_INFO_MERGE_AGENTS="Merging agent configurations..."
    MSG_SUCCESS_SETTINGS_MERGED="Settings merged."
    MSG_STEP_CONFIG_MCP="Configuring Base Sensory MCPs..."
    MSG_SUCCESS_MCP_READY="MCP Sensory Stack ready."
    MSG_STEP_INST_SKILLS="Installing Tactical Skills..."
    MSG_INFO_DEPLOYING="Deploying"
    MSG_SUCCESS_SKILLS_DEPLOYED="Tactical Skills deployed."
    MSG_STEP_CONFIG_HOOKS="Configuring Protocol Hooks..."
    MSG_SUCCESS_HOOKS_ACTIVE="Protocol Hooks active."
    MSG_STEP_ADOPT_PROTOCOLS="Agentic Protocols Adoption"
    MSG_PROTOCOLS_DESC="Elite Core Protocols enforce specific workflows:"
    MSG_PROTO_1="Auto-Type-Check: Runs 'tsc --noEmit' after changes and before build."
    MSG_PROTO_2="Commit-Sentinel: Proposes commits but NEVER auto-commits (Manual confirm)."
    MSG_PROTO_3="Skill Mastery (CRITICAL): I MUST activate ALL relevant skills (\`activate_skill\`) at the start of every task."
    MSG_PROTO_4="Bun & DB: Exclusive use of Bun and migrations (001...) with constraint verification."
    MSG_PROMPT_ADOPT="\nDo you want to adopt these Elite Core protocols in your global GEMINI.md? [Y/n]: "
    MSG_SUCCESS_GEMINI_MD="Global GEMINI.md updated with Elite Core protocols."
    MSG_INFO_SKIP_GEMINI="Skipping GEMINI.md update. You can still use the skills manually."
    MSG_FINISH="Gemini Elite Core Provisioning Complete!"
    MSG_STATUS_CLI="CLI: Nightly (v0.26.0-nightly.20260119)"
    MSG_STATUS_AGENTS="Agents: Generalist + Specialists (Active)"
    MSG_STATUS_PLANNING="Planning: Enabled (Experimental)"
    MSG_STATUS_SKILLS="Skills: Deployed (40+ Tactical MDs)"
    MSG_STATUS_HOOKS="Hooks: Monitoring active"
    YES_REGEX="^[Yy]?$"
fi

clear
echo -e "${MAGENTA}${MSG_TITLE}${NC}"
echo -e "${CYAN}${MSG_SUBTITLE}${NC}\n"

# 1. Verification and Installation of Gemini CLI
step "$MSG_STEP_CHECK_CLI"
if ! command -v gemini &> /dev/null; then
    warn "$MSG_WARN_CLI_NOT_FOUND"
    if command -v bun &> /dev/null; then
        bun install -g @google/gemini-cli@nightly > /dev/null
    else
        npm install -g @google/gemini-cli@nightly > /dev/null
    fi
    success "$MSG_SUCCESS_CLI_INSTALLED"
else
    success "$MSG_SUCCESS_CLI_DETECTED"
fi

# 2. API KEY Configuration
if [ -z "$GEMINI_API_KEY" ]; then
    echo -e "\n${MAGENTA}🔑 ${MSG_SEC_CONFIG}${NC}"
    echo -n "$MSG_ENTER_API_KEY"
    read -r USER_KEY
    if [ -n "$USER_KEY" ]; then
        export GEMINI_API_KEY="$USER_KEY"
        echo -n "$MSG_SAVE_PERM"
        read -r SAVE_KEY
        if [[ "$SAVE_KEY" =~ $YES_REGEX ]]; then
            SHELL_CONFIG="$HOME/.zshrc"
            [ ! -f "$SHELL_CONFIG" ] && SHELL_CONFIG="$HOME/.bashrc"
            echo "export GEMINI_API_KEY='$USER_KEY'" >> "$SHELL_CONFIG"
            success "$MSG_SUCCESS_KEY_SAVED $SHELL_CONFIG"
        fi
    fi
fi

# 3. Massive Skill Installation
step "$MSG_STEP_INST_SKILLS"
cd skills
for skill_dir in */; do
    [ -d "$skill_dir" ] || continue
    SKILL_NAME="${skill_dir%/}"
    LOCAL_SKILL="$SKILL_NAME/SKILL.md"
    INSTALLED_SKILL="$HOME/.gemini/skills/$SKILL_NAME/SKILL.md"

    if [ -f "$LOCAL_SKILL" ] && [ -f "$INSTALLED_SKILL" ]; then
        LOCAL_HASH=$(shasum -a 256 "$LOCAL_SKILL" | awk '{ print $1 }')
        INSTALLED_HASH=$(shasum -a 256 "$INSTALLED_SKILL" | awk '{ print $1 }')
        if [ "$LOCAL_HASH" == "$INSTALLED_HASH" ]; then continue; fi
    fi
    info "$MSG_INFO_DEPLOYING $SKILL_NAME..."
    # En v26 nightly, --consent es un flag global
    gemini skills install "$skill_dir" --force --consent &> /dev/null || true
done
cd ..
success "$MSG_SUCCESS_SKILLS_DEPLOYED"

# 4. Global MCP Registration
step "$MSG_STEP_CONFIG_MCP"
check_mcp() {
    local name=$1
    if gemini mcp list 2>/dev/null | grep -q "✓ $name:\|✗ $name:"; then
        return 0
    fi
    return 1
}

# Add chrome-devtools if missing
if ! check_mcp "chrome-devtools"; then
    info "Adding chrome-devtools MCP..."
    gemini mcp add --scope user chrome-devtools npx -y chrome-devtools-mcp @latest &> /dev/null || true
fi

# Filesystem MCP Selection (Node vs Rust)
if ! check_mcp "filesystem" || gemini mcp list 2>/dev/null | grep -q "modelcontextprotocol/server-filesystem"; then
    echo -e "\n${MAGENTA}📁 Filesystem MCP Selection${NC}"
    if [[ "$SELECTED_LANG" == "ES" ]]; then
        echo -e "1) Estándar (Node.js) - Estable"
        echo -e "2) Experimental (Rust) - Mucho más rápido, herramientas adicionales"
        echo -n "Selecciona una opción [1]: "
    else
        echo -e "1) Standard (Node.js) - Stable"
        echo -e "2) Experimental (Rust) - Faster, extra tools"
        echo -n "Select an option [1]: "
    fi
    read -r FS_CHOICE

    if [[ "$FS_CHOICE" == "2" ]]; then
        BINARY_NAME="rust-mcp-filesystem"
        # Search in common paths
        BINARY_PATH=$(command -v "$BINARY_NAME" || echo "$HOME/.cargo/bin/$BINARY_NAME" || echo "/opt/homebrew/bin/$BINARY_NAME")
        
        if [ ! -f "$BINARY_PATH" ]; then
            info "Installing rust-mcp-filesystem..."
            if [[ "$OSTYPE" == "darwin"* || "$OSTYPE" == "linux"* ]]; then
                curl --proto '=https' --tlsv1.2 -LsSf https://github.com/rust-mcp-stack/rust-mcp-filesystem/releases/download/v0.4.0/rust-mcp-filesystem-installer.sh | sh &> /dev/null || true
                BINARY_PATH=$(command -v "$BINARY_NAME" || echo "$HOME/.cargo/bin/$BINARY_NAME" || echo "/opt/homebrew/bin/$BINARY_NAME")
            else
                warn "Auto-install not supported for your OS. Please install manually: https://github.com/rust-mcp-stack/rust-mcp-filesystem"
            fi
        fi

        if [ -f "$BINARY_PATH" ] || command -v "$BINARY_NAME" &> /dev/null; then
            [ -z "$BINARY_PATH" ] && BINARY_PATH=$(command -v "$BINARY_NAME")
            # Use absolute path and correct flag -w for Rust version
            gemini mcp add --scope user filesystem "$BINARY_PATH" -w "." &> /dev/null || true
            success "Rust Filesystem MCP configured."
        else
            info "Falling back to Node.js filesystem..."
            gemini mcp add --scope user filesystem npx -y @modelcontextprotocol/server-filesystem . &> /dev/null || true
        fi
    else
        info "Adding standard filesystem MCP..."
        gemini mcp add --scope user filesystem npx -y @modelcontextprotocol/server-filesystem . &> /dev/null || true
    fi
fi

# Consensual installation of llm-tldr (Experimental)
if ! check_mcp "llm-tldr"; then
    echo -e "\n${MAGENTA}🔍 Experimental: llm-tldr MCP${NC}"
    if [[ "$SELECTED_LANG" == "ES" ]]; then
        echo -e "llm-tldr ayuda a reducir el consumo de tokens hasta un 95% y acelera el análisis estructural."
        echo -n "¿Deseas instalarlo? (Requiere Python 3) [S/n]: "
    else
        echo -e "llm-tldr helps reduce token consumption by up to 95% and speeds up structural analysis."
        echo -n "Do you want to install it? (Requires Python 3) [Y/n]: "
    fi
    read -r INSTALL_TLDR
    if [[ "$INSTALL_TLDR" =~ $YES_REGEX ]]; then
        if command -v python3 &> /dev/null && command -v pip3 &> /dev/null; then
            info "Installing llm-tldr via pip3..."
            pip3 install --user llm-tldr --break-system-packages &> /dev/null || true
            # Correct order: name command args...
            gemini mcp add --scope user llm-tldr python3 -m tldr.mcp_server &> /dev/null || true
            success "llm-tldr MCP configured in settings.json."
        else
            warn "Python 3 or pip3 not found. Skipping llm-tldr."
        fi
    fi
fi
success "$MSG_SUCCESS_MCP_READY"

# 5. Final Sync of Settings & Hooks
step "$MSG_STEP_SYNC_SETTINGS"
SETTINGS_FILE="$HOME/.gemini/settings.json"
HOOKS_DIR="$HOME/.gemini/hooks"
mkdir -p "$HOOKS_DIR"
cp hooks/*.js "$HOOKS_DIR/"

OPTIMIZED_SETTINGS='{
  "enableAgentSkills": true,
  "enableLLMCorrection": true,
  "experimental": { "introspectionAgentSettings": { "enabled": true },
    "skillCreator": true, "hooks": true, "skills": true, "planning": true, "plan": true,
    "planningMode": "auto", "planVisualization": true, "requirePlanApproval": false,
    "eventDrivenScheduler": true
  },
  "agents": {
    "generalist": { "enabled": true, "modelConfig": { "temperature": 0.5, "maxOutputTokens": 4096 }, "runConfig": { "maxTurns": 50, "timeout": 600000 } },
    "codebaseInvestigator": { "enabled": true, "modelConfig": { "temperature": 0.3, "maxOutputTokens": 4096 }, "runConfig": { "maxTurns": 100, "timeout": 600000 } },
    "codeReviewer": { "enabled": true, "modelConfig": { "temperature": 0.5, "maxOutputTokens": 2048 }, "runConfig": { "maxTurns": 30, "timeout": 300000 } },
    "bugFixer": { "enabled": true, "modelConfig": { "temperature": 0.2, "maxOutputTokens": 3000 }, "runConfig": { "maxTurns": 50, "timeout": 300000 } },
    "skillCreator": { "enabled": true, "modelConfig": { "temperature": 0.7, "maxOutputTokens": 4096 }, "runConfig": { "maxTurns": 50, "timeout": 600000 } }
  },
  "admin": {    
      "enableAdminControls": true,
      "skills": { "enabled": true },
      "mcp": { "enabled": true },
      "extensions": { "enabled": true }
    },
  "performance": {
    "enableCache": true
  },
  "general": { "previewFeatures": true, "sessionRetention": { "enabled": true }, "enablePromptCompletion": false },
  "context": { "fileFiltering": { "respectGitIgnore": true }, "loadMemoryFromIncludeDirectories": true },
  "model": { "compressionThreshold": 0.90 },
  "tools": { "shell": { "showColor": true }, "autoAccept": true },
  "ui": { "footer": { "hideContextPercentage": false }, "showMemoryUsage": true, "showModelInfoInChat": false, "showLineNumbers": false }
}'

if command -v bun &> /dev/null; then
    export OPTIMIZED_SETTINGS_JSON="$OPTIMIZED_SETTINGS"
    bun -e "
        const fs = require('fs');
        const path = require('path');
        const settingsPath = '$SETTINGS_FILE';
        const hooksDir = '$HOOKS_DIR';
        const optimized = JSON.parse(process.env.OPTIMIZED_SETTINGS_JSON);
        
        let current = {};
        if (fs.existsSync(settingsPath)) {
            try { current = JSON.parse(fs.readFileSync(settingsPath, 'utf8')); } catch(e) {}
        }

        const hooks = {
            'SessionStart': [{ 'name': 'welcome', 'type': 'command', 'command': 'bun ' + path.join(hooksDir, 'session-start-welcome.js') }],
            'AfterTool': [{ 'matcher': '*', 'hooks': [{ 'name': 'type-check', 'type': 'command', 'command': 'bun ' + path.join(hooksDir, 'after-tool-type-check.js') }] }],
            'AfterModel': [{ 'name': 'commit-check', 'type': 'command', 'command': 'bun ' + path.join(hooksDir, 'after-model-commit-check.js') }]
        };

        const merged = { 
            ...current, 
            ...optimized, 
            experimental: { ...(current.experimental || {}), ...optimized.experimental }, 
            agents: { ...(current.agents || {}), ...optimized.agents },
            mcpServers: current.mcpServers || {},
            hooks: hooks
        };
        fs.writeFileSync(settingsPath, JSON.stringify(merged, null, 2));
    "
    success "$MSG_SUCCESS_SETTINGS_MERGED"
fi

# 6. Global GEMINI.md Update with Consent
step "$MSG_STEP_ADOPT_PROTOCOLS"
echo -e "${YELLOW}${MSG_PROTOCOLS_DESC}${NC}"
echo -e "1. ${CYAN}${MSG_PROTO_1}${NC}"
echo -e "2. ${CYAN}${MSG_PROTO_2}${NC}"
echo -e "3. ${CYAN}${MSG_PROTO_3}${NC}"
echo -e "4. ${CYAN}${MSG_PROTO_4}${NC}"

echo -n -e "$MSG_PROMPT_ADOPT"
read -r ADOPT_PROTOCOLS

if [[ "$ADOPT_PROTOCOLS" =~ $YES_REGEX ]]; then
    USER_GEMINI="$HOME/.gemini/GEMINI.md"
    CURRENT_VERSION="2.3.1"

    read -r -d '' NEW_BLOCK << 'EOF' || true
<ELITE_CORE_CONTEXT>
<!-- VERSION: 2.3.1 -->
# 🚀 Gemini Elite Core - Quick Start Guide (Generalist Edition)

## 🧠 Skill Orchestration (MANDATORY & CRITICAL)
- **PROACTIVE ACTIVATION**: At the very start of ANY task, I MUST identify and activate ALL relevant tactical skills (`activate_skill`).
- **NO EXCUSES**: If a skill exists (e.g., `next16-expert`, `db-enforcer`, `tailwind4-expert`, `zustand-expert`), I MUST use it. Failure to activate the appropriate experts before acting is a major protocol violation.
- **GENERALIST FIRST**: The Generalist Agent is the coordinator, but the experts provide the precision. ALWAYS call the specialists.

## 🛡️ Mandatory Protocols

### 📦 Environment & Execution
- **Bun Exclusive**: Use EXCLUSIVELY `bun` for commands, package management, and scripts.
- **Search Hygiene**: ALWAYS exclude `node_modules`, `.next`, and `tsconfig.tsbuildinfo` from grep/search tools.
- **Directness**: Avoid `sequential-thinking` MCP. Prefer direct, efficient execution.

### 🏗️ Development & Quality
- **Type Safety**: Always run `bun x tsc --noEmit` after logic changes AND before `bun run build`.
- **Database Integrity**:
    - When adding types/enums mapping to DB columns, verify corresponding CHECK constraints.
    - NEVER execute SQL directly. Generate numbered migrations (e.g., `db/migrations/001_name.sql`).
- **Migration Naming**: Use 3-digit sequence (001, 002) instead of timestamps.

### 🤖 MIA Model Preferences
- **Fast/Smart**: `gemini-3-flash-preview`
- **Lite**: `gemini-flash-lite-latest`
- **Cerebras**: `zai-glm-4.7`

### 🏁 Task Completion & Git (STRICT)
- **NO AUTO-COMMIT**: Never perform `git commit` or `git push` automatically.
- **Closing Protocol (MANDATORY)**:
    0. Run `bun x tsc --noEmit` to verify type correctness.
    1. Explain manual verification steps to the user.
    2. Propose a Conventional Commit message.
    3. WAIT for explicit confirmation before committing (only if requested).

## ⚙️ Configured MCPs
- **chrome-devtools**, **filesystem**, **llm-tldr**.
</ELITE_CORE_CONTEXT>
EOF

    if [ -f "$USER_GEMINI" ]; then
        if [[ "$OSTYPE" == "darwin"* ]]; then
            sed -i '' '/<ELITE_CORE_CONTEXT>/,/<\/ELITE_CORE_CONTEXT>/d' "$USER_GEMINI" 2>/dev/null || true
        else
            sed -i '/<ELITE_CORE_CONTEXT>/,/^<\/ELITE_CORE_CONTEXT>$/d' "$USER_GEMINI" 2>/dev/null || true
        fi
    fi
    echo "$NEW_BLOCK" >> "$USER_GEMINI"
    success "$MSG_SUCCESS_GEMINI_MD"
else
    info "$MSG_INFO_SKIP_GEMINI"
fi

echo -e "\n${GREEN}✅ ${MSG_FINISH}${NC}"
echo -e "----------------------------------------------------"
echo -e "STATUS:"
echo -e "- ${MSG_STATUS_CLI}"
echo -e "- ${MSG_STATUS_AGENTS}"
echo -e "- ${MSG_STATUS_PLANNING}"
echo -e "- ${MSG_STATUS_SKILLS}"
echo -e "- ${MSG_STATUS_HOOKS}"
echo -e "----------------------------------------------------"