@echo off
SETLOCAL EnableDelayedExpansion

:: Gemini Elite Core Setup Script - v6.4 "Cross-Platform Integrity"
:: Windows CMD Version - Fix: Update logic + Elite Soul Protocol

:: Visual constants (ANSI Escape Sequences)
set "ESC= "
set "CYAN=%ESC%[0;36m"
set "GREEN=%ESC%[0;32m"
set "YELLOW=%ESC%[1;33m"
set "MAGENTA=%ESC%[0;35m"
set "BLUE=%ESC%[0;34m"
set "NC=%ESC%[0m"

:: Auto-Update Logic
if "%1"=="--update" (
    echo %CYAN%🚀 Updating Gemini Elite Core from repository...%NC%
    if exist .git (
        call git pull --rebase origin main
        echo %GREEN%success%NC% Repository updated. Running setup...
    ) else (
        echo %YELLOW%warn%NC% Not a git repository. Skipping git pull.
    )
    set "SELECTED_LANG=EN"
    set "CONSERVATIVE_MODE=false"
    goto :START_SETUP
)

:: Language Selection
cls
echo %MAGENTA%Select Language / Selecciona Idioma:%NC%
echo 1) English (Default)
echo 2) Español
set /p LANG_CHOICE="Selection / Seleccion [1]: "

if "%LANG_CHOICE%"=="2" (
    set "SELECTED_LANG=ES"
) else (
    set "SELECTED_LANG=EN"
)

:: Translations
if "%SELECTED_LANG%"=="ES" (
    set "MSG_TITLE=Gemini Elite Core v6.4"
    set "MSG_SUBTITLE=La suite de aprovisionamiento inteligente (Cross-Platform Update)"
    set "MSG_STEP_CHECK_CLI=Comprobando Gemini CLI..."
    set "MSG_WARN_CLI_NOT_FOUND=Gemini CLI no detectado. Instalando version @nightly..."
    set "MSG_SUCCESS_CLI_INSTALLED=Gemini CLI instalado."
    set "MSG_INFO_UPDATING_CLI=Actualizando Gemini CLI a la ultima version @nightly..."
    set "MSG_SEC_CONFIG=Configuracion de Seguridad:"
    set "MSG_ENTER_API_KEY=Introduce tu Gemini API Key (o pulsa Enter para omitir): "
    set "MSG_SAVE_PERM=¿Guardar permanentemente en las variables de entorno del usuario? (s/n): "
    set "MSG_SUCCESS_KEY_SAVED=API Key guardada permanentemente."
    set "MSG_STEP_SYNC_SETTINGS=Sincronizando Configuracion..."
    set "MSG_SUCCESS_SETTINGS_MERGED=Configuracion fusionada."
    set "MSG_STEP_CONFIG_MCP=Configurando MCPs sensoriales base..."
    set "MSG_SUCCESS_MCP_READY=Stack sensorial MCP listo."
    set "MSG_STEP_INST_SKILLS=Instalando Habilidades Tacticas..."
    set "MSG_INFO_DEPLOYING=Desplegando"
    set "MSG_SUCCESS_SKILLS_DEPLOYED=Habilidades tacticas desplegadas."
    set "MSG_STEP_ADOPT_PROTOCOLS=Adopcion de Protocolos Agenticos"
    set "MSG_PROTOCOLS_DESC=Los protocolos Elite Core imponen flujos de trabajo especificos:"
    set "MSG_PROMPT_ADOPT=¿Quieres adoptar estos protocolos Elite Core en tu GEMINI.md global? [S/n]: "
    set "MSG_SUCCESS_GEMINI_MD=GEMINI.md global actualizado."
    set "MSG_FINISH=Aprovisionamiento de Gemini Elite Core completado!"
    set "MSG_CONSERVATIVE_PROMPT=¿Quieres ser mas conservador?"
    set "MSG_ERR_SPACE=ERROR: Espacio insuficiente o error de enlace. Reintentando..."
    set "YES_VAL=s"
) else (
    set "MSG_TITLE=Gemini Elite Core v6.4"
    set "MSG_SUBTITLE=The Intelligent Provisioning Suite (Cross-Platform Update)"
    set "MSG_STEP_CHECK_CLI=Checking Gemini CLI..."
    set "MSG_WARN_CLI_NOT_FOUND=Gemini CLI not detected. Installing @nightly version..."
    set "MSG_SUCCESS_CLI_INSTALLED=Gemini CLI installed."
    set "MSG_INFO_UPDATING_CLI=Updating Gemini CLI to the latest @nightly version..."
    set "MSG_SEC_CONFIG=Security Configuration:"
    set "MSG_ENTER_API_KEY=Enter your Gemini API Key (or press Enter to skip): "
    set "MSG_SAVE_PERM=Save permanently in your user environment variables? (y/n): "
    set "MSG_SUCCESS_KEY_SAVED=API Key saved permanently."
    set "MSG_STEP_SYNC_SETTINGS=Synchronizing Settings..."
    set "MSG_SUCCESS_SETTINGS_MERGED=Settings merged."
    set "MSG_STEP_CONFIG_MCP=Configuring Base Sensory MCPs..."
    set "MSG_SUCCESS_MCP_READY=MCP Sensory Stack ready."
    set "MSG_STEP_INST_SKILLS=Installing Tactical Skills..."
    set "MSG_INFO_DEPLOYING=Deploying"
    set "MSG_SUCCESS_SKILLS_DEPLOYED=Tactical Skills deployed."
    set "MSG_STEP_ADOPT_PROTOCOLS=Agentic Protocols Adoption"
    set "MSG_PROTOCOLS_DESC=Elite Core Protocols enforce specific workflows:"
    set "MSG_PROMPT_ADOPT=Do you want to adopt these Elite Core protocols in your global GEMINI.md? [Y/n]: "
    set "MSG_SUCCESS_GEMINI_MD=Global GEMINI.md updated."
    set "MSG_FINISH=Gemini Elite Core Provisioning Complete!"
    set "MSG_CONSERVATIVE_PROMPT=Do you want to be more conservative?"
    set "MSG_ERR_SPACE=ERROR: Insufficient space or link error. Retrying..."
    set "YES_VAL=y"
)

:: Conservative Mode Selection
echo.
echo %MAGENTA%%MSG_CONSERVATIVE_PROMPT%%NC%
echo 1) Less conservative (Most powerful) [Default]
echo 2) More conservative
set /p CONSERVATIVE_CHOICE="Selection / Seleccion [1]: "

set "CONSERVATIVE_MODE=false"
if "%CONSERVATIVE_CHOICE%"=="2" set "CONSERVATIVE_MODE=true"

:START_SETUP
cls
echo %MAGENTA%%MSG_TITLE%%NC%
echo %CYAN%%MSG_SUBTITLE%%NC%
echo.

:: 1. CLI Installation
echo %CYAN%🚀 %MSG_STEP_CHECK_CLI%%NC%
where gemini >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    echo %BLUE%info%NC% %MSG_INFO_UPDATING_CLI%
) else (
    echo %YELLOW%warn%NC% %MSG_WARN_CLI_NOT_FOUND%
)

where bun >nul 2>nul
if %ERRORLEVEL% EQU 0 (
    call bun install -g @google/gemini-cli@nightly
) else (
    call npm install -g @google/gemini-cli@nightly
)
echo %GREEN%success%NC% %MSG_SUCCESS_CLI_INSTALLED%

:: 2. Configuration Directories (Forced Creation)
set "GEMINI_DIR=%USERPROFILE%\.gemini"
set "SETTINGS_FILE=%USERPROFILE%\.gemini\settings.json"
set "HOOKS_DIR=%USERPROFILE%\.gemini\hooks"
set "USER_GEMINI=%USERPROFILE%\.gemini\GEMINI.md"

if not exist "%GEMINI_DIR%" mkdir "%GEMINI_DIR%"
if not exist "%HOOKS_DIR%" mkdir "%HOOKS_DIR%"

:: 3. Tactical Skills
echo.
echo %CYAN%🚀 %MSG_STEP_INST_SKILLS%%NC%
set "SKILLS_COUNT=0"
if exist skills (
    pushd skills
    for /D %%D in (*) do (
        set "SKILL_NAME=%%D"
        set "LOCAL_SKILL=%%D\SKILL.md"
        set "INSTALLED_SKILL=%USERPROFILE%\.gemini\skills\%%D\SKILL.md"
        
        set "NEEDS_INSTALL=yes"
        if exist "!INSTALLED_SKILL!" (
            set "NEEDS_INSTALL=no"
        )

        if "!NEEDS_INSTALL!"=="yes" (
            echo %BLUE%info%NC% %MSG_INFO_DEPLOYING% %%D...
            call gemini skills install "%%D" --consent >nul 2>&1
        )
        set /a SKILLS_COUNT+=1
    )
    popd
)
echo %GREEN%success%NC% %MSG_SUCCESS_SKILLS_DEPLOYED% (%SKILLS_COUNT% skills)

:: 4. MCP Setup
echo.
echo %CYAN%🚀 %MSG_STEP_CONFIG_MCP%%NC%

:: Check chrome-devtools
call gemini mcp list 2>nul | findstr /C:"chrome-devtools" >nul
if %ERRORLEVEL% NEQ 0 (
    echo %BLUE%info%NC% Adding chrome-devtools MCP...
    call gemini mcp add --scope user chrome-devtools npx -y chrome-devtools-mcp @latest >nul 2>&1
)

:: Filesystem MCP (Rust vs Node)
call gemini mcp list 2>nul | findstr /C:"filesystem" >nul
if %ERRORLEVEL% NEQ 0 (
    if "%CONSERVATIVE_MODE%"=="false" (
        where rust-mcp-filesystem >nul 2>nul
        if %ERRORLEVEL% EQU 0 (
            echo %GREEN%success%NC% Rust Filesystem MCP detected.
            call gemini mcp add --scope user filesystem rust-mcp-filesystem -w "." "%USERPROFILE%\.gemini\skills" >nul 2>&1
        ) else (
            echo %BLUE%info%NC% rust-mcp-filesystem not found in PATH. Falling back to Node.js...
            call gemini mcp add --scope user filesystem npx -y @modelcontextprotocol/server-filesystem "." >nul 2>&1
        )
    ) else (
        echo %BLUE%info%NC% Conservative Mode: Using standard Node.js filesystem MCP...
        call gemini mcp add --scope user filesystem npx -y @modelcontextprotocol/server-filesystem "." >nul 2>&1
    )
)
echo %GREEN%success%NC% %MSG_SUCCESS_MCP_READY%

:: 5. Sync Settings (Full Elite Core Configuration)
echo.
echo %CYAN%🚀 %MSG_STEP_SYNC_SETTINGS%%NC%
set "TEMP_SCRIPT=%TEMP%\gemini_merge.js"

echo const fs = require('fs'); > "%TEMP_SCRIPT%"
echo const path = require('path'); >> "%TEMP_SCRIPT%"
echo const settingsPath = process.argv[2]; >> "%TEMP_SCRIPT%"
echo const hooksDir = process.argv[3]; >> "%TEMP_SCRIPT%"
echo const optimized = { >> "%TEMP_SCRIPT%"
echo   enableAgentSkills: true, >> "%TEMP_SCRIPT%"
echo   core: { disableLLMCorrection: true }, >> "%TEMP_SCRIPT%"
echo   experimental: { >> "%TEMP_SCRIPT%"
echo     introspectionAgentSettings: { enabled: true }, >> "%TEMP_SCRIPT%"
echo     skillCreator: true, >> "%TEMP_SCRIPT%"
echo     hooks: true, >> "%TEMP_SCRIPT%"
echo     hooksSystem: true, >> "%TEMP_SCRIPT%"
echo     planning: true, >> "%TEMP_SCRIPT%"
echo     eventDrivenScheduler: true >> "%TEMP_SCRIPT%"
echo   }, >> "%TEMP_SCRIPT%"
echo   agents: { >> "%TEMP_SCRIPT%"
echo     generalist: { enabled: true, runConfig: { maxTurns: 50, timeout: 600000 } }, >> "%TEMP_SCRIPT%"
echo     codebaseInvestigator: { enabled: true, runConfig: { maxTurns: 100, timeout: 600000 } }, >> "%TEMP_SCRIPT%"
echo     codeReviewer: { enabled: true, runConfig: { maxTurns: 30, timeout: 300000 } }, >> "%TEMP_SCRIPT%"
echo     bugFixer: { enabled: true, runConfig: { maxTurns: 50, timeout: 300000 } } >> "%TEMP_SCRIPT%"
echo   }, >> "%TEMP_SCRIPT%"
echo   model: { name: 'gemini-3-flash-preview' }, >> "%TEMP_SCRIPT%"
echo   tools: { autoAccept: true } >> "%TEMP_SCRIPT%"
echo }; >> "%TEMP_SCRIPT%"
echo try { >> "%TEMP_SCRIPT%"
echo   let current = {}; >> "%TEMP_SCRIPT%"
echo   if (fs.existsSync(settingsPath)) { >> "%TEMP_SCRIPT%"
echo     const content = fs.readFileSync(settingsPath, 'utf8'); >> "%TEMP_SCRIPT%"
echo     if (content.trim()) current = JSON.parse(content); >> "%TEMP_SCRIPT%"
echo   } >> "%TEMP_SCRIPT%"
echo   const hooks = { >> "%TEMP_SCRIPT%"
echo     'SessionStart': [{ 'matcher': '*', 'hooks': [{ 'name': 'welcome', 'type': 'command', 'command': 'bun ' + path.join(hooksDir, 'session-start-welcome.js') }] }], >> "%TEMP_SCRIPT%"
echo     'AfterTool': [{ 'matcher': '*', 'hooks': [{ 'name': 'type-check', 'type': 'command', 'command': 'bun ' + path.join(hooksDir, 'after-tool-type-check.js') }] }], >> "%TEMP_SCRIPT%"
echo     'AfterModel': [{ 'matcher': '*', 'hooks': [{ 'name': 'commit-check', 'type': 'command', 'command': 'bun ' + path.join(hooksDir, 'after-model-commit-check.js') }] }] >> "%TEMP_SCRIPT%"
echo   }; >> "%TEMP_SCRIPT%"
echo   const merged = { ...current, ...optimized, >> "%TEMP_SCRIPT%"
echo     experimental: { ...(current.experimental || {}), ...optimized.experimental }, >> "%TEMP_SCRIPT%"
echo     agents: { ...(current.agents || {}), ...optimized.agents }, >> "%TEMP_SCRIPT%"
echo     hooks: hooks >> "%TEMP_SCRIPT%"
echo   }; >> "%TEMP_SCRIPT%"
echo   fs.writeFileSync(settingsPath, JSON.stringify(merged, null, 2)); >> "%TEMP_SCRIPT%"
echo   process.exit(0); >> "%TEMP_SCRIPT%"
echo } catch (e) { >> "%TEMP_SCRIPT%"
echo   process.exit(1); >> "%TEMP_SCRIPT%"
echo } >> "%TEMP_SCRIPT%"

where bun >nul 2>nul
if %ERRORLEVEL% EQU 0 (set "RUNNER=bun") else (set "RUNNER=node")

echo %BLUE%info%NC% Merging via %RUNNER%...
call %RUNNER% "%TEMP_SCRIPT%" "%SETTINGS_FILE%" "%HOOKS_DIR%"

if %ERRORLEVEL% EQU 0 (
    echo %GREEN%success%NC% %MSG_SUCCESS_SETTINGS_MERGED%
) else (
    echo %YELLOW%warn%NC% Fallback: Manual creation...
    echo {"enableAgentSkills":true,"model":{"name":"gemini-3-flash-preview"}} > "%SETTINGS_FILE%"
)
if exist "%TEMP_SCRIPT%" del "%TEMP_SCRIPT%"

:: 5.5 Copying Hooks
if exist hooks (
    echo %BLUE%info%NC% Deploying Protocol Hooks...
    copy /Y hooks\*.js "%HOOKS_DIR%\" >nul 2>&1
)

:: 5.6 Dynamic path recording for update checks
echo %CD% > "%USERPROFILE%\.gemini\.elite_core_path"

:: 6. Global GEMINI.md (Path Stabilized Writing)
echo.
if "%CONSERVATIVE_MODE%"=="false" (
    set "ADOPT_PROTOCOLS=%YES_VAL%"
) else (
    echo %CYAN%🚀 %MSG_STEP_ADOPT_PROTOCOLS%%NC%
    echo %YELLOW%%MSG_PROTOCOLS_DESC%%NC%
    set /p ADOPT_PROTOCOLS="%MSG_PROMPT_ADOPT%"
)

if /I "%ADOPT_PROTOCOLS%"=="%YES_VAL%" (
    :: Re-verify directory exists just before writing
    if not exist "%USERPROFILE%\.gemini" mkdir "%USERPROFILE%\.gemini"

    :: Write line by line using absolute system paths
    (
    echo ^<ELITE_CORE_CONTEXT^>
    echo ^<!-- VERSION: 2.4.0 --^>
    echo # 🚀 Gemini Elite Core - Quick Start Guide ^(Generalist Edition^)
    echo.
    echo ## 🪐 The Agent Soul: ADN ^& Work Ethics ^(MANDATORY^)
    echo.
    echo ### 1. Identity and Purpose
    echo You are an **Elite Senior Software Engineer ^(2026^)**. You are not a simple assistant; you are the architect and executor of high-performance systems. Your mission is to transform every prompt into a superior technical solution, following the most demanding industry standards.
    echo.
    echo ### 2. Non-Negotiable Work Ethics
    echo - **Zero Tolerance for `any`**: Typing must be strict and descriptive. If a type doesn't exist, create it. Do not "vibe-code" without types.
    echo - **Atomicity and Security**: NEVER use `git add .`. It is a protocol violation. Use EXCLUSIVELY `~/.gemini/scripts/committer.sh` for surgical and safe staging.
    echo - **Technical Conciseness**: Speak with code and facts. Avoid unnecessary preambles ^("Okay, I will..."^). Be direct and professional.
    echo - **Performance v0.27**: Always prioritize the new capabilities of Gemini CLI v0.27+ ^(Event-Driven Scheduler, Plan Mode, Hooks^).
    echo.
    echo ### 3. Action Protocols
    echo - **Plan Mode First**: Before executing complex tasks, use Plan Mode ^(`Shift+Tab`^) to validate the strategy with the user.
    echo - **Skill Mastery**: Before touching any framework ^(Next.js, React, Supabase^), you MUST activate the corresponding skill ^(`activate_skill`^). Acting without expert context is negligence.
    echo - **Mandatory Modularity**: If a file approaches 500 lines, stop and propose a refactor. Large files are the enemy of intelligence.
    echo - **Continuous Validation**: Every logic change must be followed by a type check ^(`TSC`^) and, if possible, unit tests.
    echo.
    echo ### 4. Communication Style
    echo - Professional, direct, and resolution-oriented tone.
    echo - Clean and hierarchical Markdown format.
    echo - Responses of less than 3 lines ^(outside of code/tool blocks^) unless a deep explanation is required.
    echo.
    echo ## 🧠 Agentic Delegation ^& Orchestration ^(MANDATORY^)
    echo - **GENERALIST FIRST**: You are a Generalist Orchestrator. For complex tasks, you MUST delegate to specialized agents using `delegate_to_agent`.
    echo - **SKILL CONDUCTOR**: Always activate `conductor-pro` ^(`activate_skill`^) when a task requires coordination between multiple specialized skills or deep workflow planning.
    echo - **SPECIALISTS**: 
    echo     - `@codebaseInvestigator`: Use for architectural mapping and deep code analysis.
    echo     - `@codeReviewer`: Use for refactoring, style checks, and PR reviews.
    echo     - `@bugFixer`: Use for debugging and test generation.
    echo - **AUTONOMY**: Do not ask for permission to delegate or activate the conductor if the task clearly benefits from it.
    echo.
    echo ## 🛠️ Skill Orchestration ^(CRITICAL^)
    echo - **PROACTIVE ACTIVATION**: At the start of ANY task, identify and activate ALL relevant tactical skills ^(`activate_skill`^).
    echo - **NO EXCUSES**: If a skill exists, use it. Failure to activate experts before acting is a protocol violation.
    echo.
    echo ## 🛡️ Mandatory Protocols
    echo.
    echo ### 🪐 The Agent Soul
    echo - **Identity**: You are an Elite Senior Engineer. Follow the rules in the Soul section above as absolute mandates.
    echo - **Ethics**: No `any`, concise communication, performance-first.
    echo.
    echo ### 📦 Environment ^& Execution
    echo - **Bun Exclusive**: Use EXCLUSIVELY `bun` for commands, package management, and scripts.
    echo - **Search Hygiene**: ALWAYS exclude `node_modules`, `.next`, and `tsconfig.tsbuildinfo` from grep/search tools.
    echo - **Directness**: Avoid `sequential-thinking` MCP. Prefer direct, efficient execution.
    echo.
    echo ### 🏗️ Development ^& Quality
    echo - **Type Safety**: Always run `bun x tsc --noEmit` after logic changes AND before `bun run build`.
    echo - **Database Integrity**: NEVER execute SQL directly. Generate numbered migrations ^(001_name.sql^).
    echo.
    echo ### 🏁 Task Completion ^& Git ^(STRICT^)
    echo - **NO AUTO-COMMIT**: Never perform `git commit` or `git push` automatically.
    echo - **Closing Protocol ^(MANDATORY^)**:
    echo     0. Run `bun x tsc --noEmit` to verify type correctness.
    echo     1. Explain manual verification steps to the user.
    echo     2. Propose a Conventional Commit message.
    echo     3. WAIT for explicit confirmation before committing ^(only if requested^).
    echo.
    echo ## ⚙️ Configured MCPs
    echo - **chrome-devtools**, **filesystem**, **llm-tldr**.
    echo.
    echo ## 🌐 Web Automation ^& Browser Protocol ^(CRITICAL^)
    echo When asked to interact with a website or browse the internet, I MUST follow this protocol:
    echo.
    echo 1.  **Visual Debugging ^& Browsing ^(`chrome-devtools`^)**:
    echo     - **Default Choice**: Use for documentation search, error research, content extraction, and multi-step tasks.
    echo     - **Criteria**: Reliability and visual context. This is the primary and only configured tool for web interaction.
    echo.
    echo 2.  **Rule of Thumb**: ALWAYS use `chrome-devtools` for web-related tasks ^(actions, info, and debugging^).
    echo ^</ELITE_CORE_CONTEXT^>
    ) > "%USER_GEMINI%"

    if exist "%USER_GEMINI%" (
        echo %GREEN%success%NC% %MSG_SUCCESS_GEMINI_MD%
    ) else (
        echo %YELLOW%warn%NC% Could not verify GEMINI.md creation.
    )
)

echo.
echo %GREEN%✅ %MSG_FINISH%%NC%
echo ----------------------------------------------------
echo STATUS: Nightly (v0.27.0-Windows) ^| Skills: %SKILLS_COUNT%
echo ----------------------------------------------------
pause
