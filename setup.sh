#!/bin/bash

# Gemini Elite Core Setup Script - v5.6 "Skill Mastery Edition"
# Optimized for Gemini CLI v0.27.0+ (Nightly 20260122)
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
    MSG_TITLE="Gemini Elite Core v5.6"
    MSG_SUBTITLE="La suite de aprovisionamiento inteligente (Skill Mastery Update)"
    MSG_STEP_CHECK_CLI="Comprobando Gemini CLI..."
    MSG_WARN_CLI_NOT_FOUND="Gemini CLI no detectado. Instalando versión @nightly..."
    MSG_SUCCESS_CLI_INSTALLED="Gemini CLI instalado."
    MSG_SUCCESS_CLI_DETECTED="Gemini CLI detectado."
    MSG_INFO_UPDATING_CLI="Actualizando Gemini CLI a la última versión @nightly..."
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
    MSG_STATUS_CLI="CLI: Nightly (v0.27.0-nightly.20260122)"
    MSG_STATUS_AGENTS="Agentes: Generalist + Especialistas (Activos)"
    MSG_STATUS_PLANNING="Planificación: Interactive Mode (v0.27)"
    MSG_STATUS_SKILLS="Habilidades: Desplegadas (Code Reviewer +)"
    MSG_STATUS_HOOKS="Hooks: System Active"
    MSG_CONSERVATIVE_PROMPT="¿Quieres ser más conservador o menos conservador?"
    MSG_CONSERVATIVE_OPT1="1) Menos conservador (Más potente) [Predeterminado]"
    MSG_CONSERVATIVE_OPT2="2) Más conservador"
    # MSG_STEP_CONFIG_BROWSER_USE="Configurando browser-use (Automatización Web)..."
    # MSG_PROMPT_BROWSER_USE="browser-use permite a Gemini navegar por internet, extraer datos y completar tareas en sitios web. ¿Deseas instalarlo? (Requiere Python 3 y uv) [S/n]: "
    YES_REGEX="^[Ss]?$"
else
    MSG_TITLE="Gemini Elite Core v5.6"
    MSG_SUBTITLE="The Intelligent Provisioning Suite (Skill Mastery Update)"
    MSG_STEP_CHECK_CLI="Checking Gemini CLI..."
    MSG_WARN_CLI_NOT_FOUND="Gemini CLI not detected. Installing @nightly version..."
    MSG_SUCCESS_CLI_INSTALLED="Gemini CLI installed."
    MSG_SUCCESS_CLI_DETECTED="Gemini CLI detected."
    MSG_INFO_UPDATING_CLI="Updating Gemini CLI to the latest @nightly version..."
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
    MSG_STATUS_CLI="CLI: Nightly (v0.27.0-nightly.20260122)"
    MSG_STATUS_AGENTS="Agents: Generalist + Specialists (Active)"
    MSG_STATUS_PLANNING="Planning: Interactive Mode (v0.27)"
    MSG_STATUS_SKILLS="Skills: Deployed (Code Reviewer +)"
    MSG_STATUS_HOOKS="Hooks: System Active"
    MSG_CONSERVATIVE_PROMPT="Do you want to be more conservative or less conservative?"
    MSG_CONSERVATIVE_OPT1="1) Less conservative (Most powerful) [Default]"
    MSG_CONSERVATIVE_OPT2="2) More conservative"
    # MSG_STEP_CONFIG_BROWSER_USE="Configuring browser-use (Web Automation)..."
    # MSG_PROMPT_BROWSER_USE="browser-use allows Gemini to browse the internet, extract data, and complete tasks on websites. Do you want to install it? (Requires Python 3 and uv) [Y/n]: "
    YES_REGEX="^[Yy]?$"
fi

# Conservative Mode Selection
echo -e "\n${MAGENTA}${MSG_CONSERVATIVE_PROMPT}${NC}"
echo -e "${MSG_CONSERVATIVE_OPT1}"
echo -e "${MSG_CONSERVATIVE_OPT2}"
echo -n "Selection / Selección [1]: "
read -r CONSERVATIVE_CHOICE

if [[ "$CONSERVATIVE_CHOICE" == "2" ]]; then
    CONSERVATIVE_MODE="true"
else
    CONSERVATIVE_MODE="false"
fi

clear
echo -e "${MAGENTA}${MSG_TITLE}${NC}"
echo -e "${CYAN}${MSG_SUBTITLE}${NC}\n"

# 1. Verification and Installation of Gemini CLI
step "$MSG_STEP_CHECK_CLI"
if command -v gemini &> /dev/null; then
    info "$MSG_INFO_UPDATING_CLI"
else
    warn "$MSG_WARN_CLI_NOT_FOUND"
fi

if command -v bun &> /dev/null; then
    bun install -g @google/gemini-cli@nightly > /dev/null
else
    npm install -g @google/gemini-cli@nightly > /dev/null
fi
success "$MSG_SUCCESS_CLI_INSTALLED"

# 2. API KEY Configuration
if [ -z "$GEMINI_API_KEY" ]; then
    echo -e "\n${MAGENTA}🔑 ${MSG_SEC_CONFIG}${NC}"
    echo -n "$MSG_ENTER_API_KEY"
    read -r USER_KEY
    if [ -n "$USER_KEY" ]; then
        export GEMINI_API_KEY="$USER_KEY"
        if [[ "$CONSERVATIVE_MODE" == "false" ]]; then
            if [[ "$SELECTED_LANG" == "ES" ]]; then
                SAVE_KEY="s"
            else
                SAVE_KEY="y"
            fi
        else
            echo -n "$MSG_SAVE_PERM"
            read -r SAVE_KEY
        fi
        
        if [[ "$SAVE_KEY" =~ $YES_REGEX ]]; then
            SHELL_CONFIG="$HOME/.zshrc"
            [ ! -f "$SHELL_CONFIG" ] && SHELL_CONFIG="$HOME/.bashrc"
            echo "export GEMINI_API_KEY='$USER_KEY'" >> "$SHELL_CONFIG"
            success "$MSG_SUCCESS_KEY_SAVED $SHELL_CONFIG"
        fi
    fi
fi

# 2.5 Browser Use API KEY Configuration (Commented out - causing issues)
# if [ -z "$BROWSER_USE_API_KEY" ]; then
#     echo -e "\n${MAGENTA}🌐 Browser Use API Configuration${NC}"
#     echo -e "Get your \$10 free credits at: ${CYAN}https://cloud.browser-use.com/new-api-key${NC}"
#     echo -n "Enter your BROWSER_USE_API_KEY (or press Enter to skip): "
#     read -r BU_KEY
#     if [ -n "$BU_KEY" ]; then
#         export BROWSER_USE_API_KEY="$BU_KEY"
#         echo -n "$MSG_SAVE_PERM"
#         read -r SAVE_BU_KEY
#         if [[ "$SAVE_BU_KEY" =~ $YES_REGEX ]]; then
#             SHELL_CONFIG="$HOME/.zshrc"
#             [ ! -f "$SHELL_CONFIG" ] && SHELL_CONFIG="$HOME/.bashrc"
#             echo "export BROWSER_USE_API_KEY='$BU_KEY'" >> "$SHELL_CONFIG"
#             success "$MSG_SUCCESS_KEY_SAVED $SHELL_CONFIG"
#         fi
#     fi
# fi

# 3. Massive Skill Installation
step "$MSG_STEP_INST_SKILLS"
SKILLS_COUNT=0
cd skills
for skill_dir in */; do
    [ -d "$skill_dir" ] || continue
    SKILL_NAME="${skill_dir%/}"
    LOCAL_SKILL="$SKILL_NAME/SKILL.md"
    INSTALLED_SKILL="$HOME/.gemini/skills/$SKILL_NAME/SKILL.md"

    if [ -f "$LOCAL_SKILL" ] && [ -f "$INSTALLED_SKILL" ]; then
        LOCAL_HASH=$(shasum -a 256 "$LOCAL_SKILL" | awk '{ print $1 }')
        INSTALLED_HASH=$(shasum -a 256 "$INSTALLED_SKILL" | awk '{ print $1 }')
        if [ "$LOCAL_HASH" == "$INSTALLED_HASH" ]; then 
            SKILLS_COUNT=$((SKILLS_COUNT + 1))
            continue
        fi
    fi
    info "$MSG_INFO_DEPLOYING $SKILL_NAME..."
    # En v26 nightly, --consent es un flag global
    gemini skills install "$skill_dir" --consent &> /dev/null || true
    SKILLS_COUNT=$((SKILLS_COUNT + 1))
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

# Filesystem MCP Selection (Automatic)
if ! check_mcp "filesystem" || gemini mcp list 2>/dev/null | grep -q "modelcontextprotocol/server-filesystem"; then
    if [[ "$CONSERVATIVE_MODE" == "false" ]]; then
        BINARY_NAME="rust-mcp-filesystem"
        # Search in common paths
        BINARY_PATH=$(command -v "$BINARY_NAME" || echo "$HOME/.cargo/bin/$BINARY_NAME" || echo "/opt/homebrew/bin/$BINARY_NAME")
        
        if [ ! -f "$BINARY_PATH" ]; then
            info "Installing rust-mcp-filesystem (Fast/Experimental)..."
            if [[ "$OSTYPE" == "darwin"* || "$OSTYPE" == "linux"* ]]; then
                curl --proto '=https' --tlsv1.2 -LsSf https://github.com/rust-mcp-stack/rust-mcp-filesystem/releases/download/v0.4.0/rust-mcp-filesystem-installer.sh | sh &> /dev/null || true
                BINARY_PATH=$(command -v "$BINARY_NAME" || echo "$HOME/.cargo/bin/$BINARY_NAME" || echo "/opt/homebrew/bin/$BINARY_NAME")
            fi
        fi

        if [ -f "$BINARY_PATH" ] || command -v "$BINARY_NAME" &> /dev/null; then
            [ -z "$BINARY_PATH" ] && BINARY_PATH=$(command -v "$BINARY_NAME")
            gemini mcp add --scope user filesystem "$BINARY_PATH" -w "." &> /dev/null || true
            success "Rust Filesystem MCP configured."
        else
            info "Falling back to Node.js filesystem..."
            gemini mcp add --scope user filesystem npx -y @modelcontextprotocol/server-filesystem . &> /dev/null || true
        fi
    else
        info "Adding standard Node.js filesystem MCP..."
        gemini mcp add --scope user filesystem npx -y @modelcontextprotocol/server-filesystem . &> /dev/null || true
    fi
fi

# Skip llm-tldr (not used)

# Consensual installation of browser-use (Commented out - causing issues)
# if ! check_mcp "browser-use"; then
#     echo -e "\n${MAGENTA}🌐 Experimental: browser-use MCP${NC}"
#     echo -e "$MSG_PROMPT_BROWSER_USE"
#     read -r INSTALL_BROWSER_USE
#     if [[ "$INSTALL_BROWSER_USE" =~ $YES_REGEX ]]; then
#         if command -v python3 &> /dev/null; then
#             info "Installing browser-use dependencies..."
#             # Install uv if not present
#             if ! command -v uv &> /dev/null; then
#                 info "Installing uv..."
#                 if [[ "$OSTYPE" == "darwin"* ]] && command -v brew &> /dev/null; then
#                     brew install uv &> /dev/null || true
#                 else
#                     curl -LsSf https://astral.sh/uv/install.sh | sh &> /dev/null || true
#                 fi
#                 
#                 # Expand PATH to find uv in common install locations
#                 export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.astral-uv/bin:/opt/homebrew/bin:$PATH"
#                 
#                 # Final fallback if still not found
#                 if ! command -v uv &> /dev/null && command -v pip3 &> /dev/null; then
#                     pip3 install uv --break-system-packages &> /dev/null || true
#                 fi
#             fi
#             
#             if command -v uv &> /dev/null; then
#                 info "Installing browser-use dependencies via uv..."
#                 # Use uv style for installation
#                 uv pip install browser-use playwright --break-system-packages &> /dev/null || true
#                 uv run playwright install chromium &> /dev/null || true
#                 
#                 # Register using uvx to handle environment automatically
#                 # We use a flag to mark it for the bun merge script
#                 export INSTALL_BROWSER_USE_MCP=true
#                 success "browser-use dependencies installed."
#             else
#                 warn "uv installation failed. Skipping browser-use."
#             fi
#         else
#             warn "Python 3 not found. Skipping browser-use."
#         fi
#     fi
# fi
success "$MSG_SUCCESS_MCP_READY"

# 5. Final Sync of Settings & Hooks
step "$MSG_STEP_SYNC_SETTINGS"
SETTINGS_FILE="$HOME/.gemini/settings.json"
HOOKS_DIR="$HOME/.gemini/hooks"
mkdir -p "$HOOKS_DIR"
cp hooks/*.js "$HOOKS_DIR/"

OPTIMIZED_SETTINGS='{
  "enableAgentSkills": true,
  "core": {
    "disableLLMCorrection": true
  },
  "skills": {
    "enabled": true,
    "codeReviewer": {
      "enabled": true
    }
  },
  "experimental": { 
    "introspectionAgentSettings": { "enabled": true },
    "skillCreator": true, 
    "hooks": true,
    "hooksSystem": true,
    "skills": true, 
    "planning": true, 
    "plan": true,
    "planningMode": "auto", 
    "planVisualization": true, 
    "requirePlanApproval": false,
    "eventDrivenScheduler": true
  },
  "plan": {
    "approvalMode": "interactive"
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
  "model": { "compressionThreshold": 0.90, "name": "gemini-3-flash-preview" },
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
            'SessionStart': [{ 'matcher': '*', 'hooks': [{ 'name': 'welcome', 'type': 'command', 'command': 'bun ' + path.join(hooksDir, 'session-start-welcome.js') }] }],
            'AfterTool': [{ 'matcher': '*', 'hooks': [{ 'name': 'type-check', 'type': 'command', 'command': 'bun ' + path.join(hooksDir, 'after-tool-type-check.js') }] }],
            'AfterModel': [{ 'matcher': '*', 'hooks': [{ 'name': 'commit-check', 'type': 'command', 'command': 'bun ' + path.join(hooksDir, 'after-model-commit-check.js') }] }]
        };

        const mcpServers = current.mcpServers || {};
        
        // Ensure browser-use is added if the flag was set (Commented out - causing issues)
        /*
        if (process.env.INSTALL_BROWSER_USE_MCP === 'true') {
            mcpServers['browser-use'] = {
                command: 'uvx',
                args: ['--quiet', '--with', 'playwright', '--with', 'browser-use', 'mcp-server-browser-use', 'server'],
                env: {
                    GOOGLE_API_KEY: process.env.GEMINI_API_KEY || \"\",
                    BROWSER_USE_API_KEY: process.env.BROWSER_USE_API_KEY || \"\"
                }
            };
        }
        */

        const merged = { 
            ...current, 
            ...optimized, 
            experimental: { ...(current.experimental || {}), ...optimized.experimental }, 
            agents: { ...(current.agents || {}), ...optimized.agents },
            mcpServers: mcpServers,
            hooks: hooks
        };
        fs.writeFileSync(settingsPath, JSON.stringify(merged, null, 2));
    "
    success "$MSG_SUCCESS_SETTINGS_MERGED"
fi

# 6. Global GEMINI.md Update with Consent
if [[ "$CONSERVATIVE_MODE" == "false" ]]; then
    if [[ "$SELECTED_LANG" == "ES" ]]; then
        ADOPT_PROTOCOLS="s"
    else
        ADOPT_PROTOCOLS="y"
    fi
else
    step "$MSG_STEP_ADOPT_PROTOCOLS"
    echo -e "${YELLOW}${MSG_PROTOCOLS_DESC}${NC}"
    echo -e "1. ${CYAN}${MSG_PROTO_1}${NC}"
    echo -e "2. ${CYAN}${MSG_PROTO_2}${NC}"
    echo -e "3. ${CYAN}${MSG_PROTO_3}${NC}"
    echo -e "4. ${CYAN}${MSG_PROTO_4}${NC}"

    echo -n -e "$MSG_PROMPT_ADOPT"
    read -r ADOPT_PROTOCOLS
fi

if [[ "$ADOPT_PROTOCOLS" =~ $YES_REGEX ]]; then
    USER_GEMINI="$HOME/.gemini/GEMINI.md"
    CURRENT_VERSION="2.4.0"

    read -r -d '' NEW_BLOCK << 'EOF' || true
<ELITE_CORE_CONTEXT>
<!-- VERSION: 2.4.0 -->
# 🚀 Gemini Elite Core - Quick Start Guide (Generalist Edition)

## 🧠 Agentic Delegation & Orchestration (MANDATORY)
- **GENERALIST FIRST**: You are a Generalist Orchestrator. For complex tasks, you MUST delegate to specialized agents using `delegate_to_agent`.
- **SKILL CONDUCTOR**: Always activate `conductor-pro` (`activate_skill`) when a task requires coordination between multiple specialized skills or deep workflow planning.
- **SPECIALISTS**: 
    - `@codebaseInvestigator`: Use for architectural mapping and deep code analysis.
    - `@codeReviewer`: Use for refactoring, style checks, and PR reviews.
    - `@bugFixer`: Use for debugging and test generation.
- **AUTONOMY**: Do not ask for permission to delegate or activate the conductor if the task clearly benefits from it.

## 🛠️ Skill Orchestration (CRITICAL)
- **PROACTIVE ACTIVATION**: At the start of ANY task, identify and activate ALL relevant tactical skills (`activate_skill`).
- **NO EXCUSES**: If a skill exists, use it. Failure to activate experts before acting is a protocol violation.

## 🛡️ Mandatory Protocols

### 📦 Environment & Execution
- **Bun Exclusive**: Use EXCLUSIVELY `bun` for commands, package management, and scripts.
- **Search Hygiene**: ALWAYS exclude `node_modules`, `.next`, and `tsconfig.tsbuildinfo` from grep/search tools.
- **Directness**: Avoid `sequential-thinking` MCP. Prefer direct, efficient execution.

### 🏗️ Development & Quality
- **Type Safety**: Always run `bun x tsc --noEmit` after logic changes AND before `bun run build`.
- **Database Integrity**: NEVER execute SQL directly. Generate numbered migrations (001_name.sql).

### 🏁 Task Completion & Git (STRICT)
- **NO AUTO-COMMIT**: Never perform `git commit` or `git push` automatically.
- **Closing Protocol (MANDATORY)**:
    0. Run `bun x tsc --noEmit` to verify type correctness.
    1. Explain manual verification steps to the user.
    2. Propose a Conventional Commit message.
    3. WAIT for explicit confirmation before committing (only if requested).

## ⚙️ Configured MCPs
- **chrome-devtools**, **filesystem**, **llm-tldr**.

## 🌐 Web Automation & Browser Protocol (CRITICAL)
When asked to interact with a website or browse the internet, I MUST follow this protocol:

1.  **Visual Debugging & Browsing (`chrome-devtools`)**:
    - **Default Choice**: Use for documentation search, error research, content extraction, and multi-step tasks.
    - **Criteria**: Reliability and visual context. This is the primary and only configured tool for web interaction.

2.  **Rule of Thumb**: ALWAYS use `chrome-devtools` for web-related tasks (actions, info, and debugging).
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
echo -e "- ${MSG_STATUS_SKILLS} (${SKILLS_COUNT} skills)"
echo -e "- ${MSG_STATUS_HOOKS}"
echo -e "----------------------------------------------------"