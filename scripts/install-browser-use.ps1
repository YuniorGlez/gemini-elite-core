# browser-use Installation Script for Gemini Elite Core (Windows)
# Optimized for high-reliability web automation in 2026.
# Fix: Ensures Python 3.12 is used via uv to avoid version conflicts.

$ErrorActionPreference = "Stop"

function Write-Info($msg) { Write-Host "info $msg" -ForegroundColor Blue }
function Write-Success($msg) { Write-Host "success $msg" -ForegroundColor Green }
function Write-Warn($msg) { Write-Host "warn $msg" -ForegroundColor Yellow }

Write-Info "Checking for Python 3..."
if (!(Get-Command python -ErrorAction SilentlyContinue)) {
    Write-Warn "Python not found. Please install Python 3 from python.org or Microsoft Store."
    exit 1
}

Write-Info "Checking for uv (The Fast Python Package Manager)..."
if (!(Get-Command uv -ErrorAction SilentlyContinue)) {
    Write-Info "uv not found. Installing uv..."
    powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
    # Update Path for current session
    $env:Path += ";$env:USERPROFILE\.cargo\bin"
}

# Asegurar versión mínima de Python para browser-use
Write-Info "Ensuring Python 3.12 via uv..."
& uv python install 3.12

if (Get-Command uv -ErrorAction SilentlyContinue) {
    Write-Info "Installing browser-use via uv tool (Python 3.12 isolated)..."
    # Usar el operador de ejecución & para mayor seguridad con uv
    & uv tool install browser-use --python 3.12 --force
    
    Write-Info "Installing Playwright browsers..."
    & uv run --python 3.12 --with playwright playwright install chromium
} else {
    Write-Info "Installing browser-use via pip fallback..."
    & pip install browser-use playwright
    & python -m playwright install chromium
}

# Verificar instalación
if (Get-Command browser-use -ErrorAction SilentlyContinue) {
    Write-Success "browser-use CLI installed successfully!"
} else {
    $localBin = "$env:USERPROFILE\.local\bin"
    Write-Warn "browser-use installed but CLI not found in PATH."
    Write-Host "Hint: Restart your terminal or add '$localBin' to your PATH." -ForegroundColor Yellow
}

Write-Success "Installation process finished."
