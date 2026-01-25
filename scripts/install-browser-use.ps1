# browser-use Installation Script for Gemini Elite Core (Windows)
# Optimized for high-reliability web automation in 2026.

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

if (Get-Command uv -ErrorAction SilentlyContinue) {
    Write-Info "Installing browser-use via uv tool (isolated)..."
    uv tool install browser-use --force
    
    Write-Info "Installing Playwright browsers..."
    uv run playwright install chromium
} else {
    Write-Info "Installing browser-use via pip..."
    pip install browser-use playwright
    python -m playwright install chromium
}

if (Get-Command browser-use -ErrorAction SilentlyContinue) {
    Write-Success "browser-use CLI installed successfully!"
} else {
    Write-Warn "browser-use installed but CLI not found in PATH."
    Write-Host "Hint: Restart your terminal or add '$env:USERPROFILE\.local\bin' to your PATH." -ForegroundColor Yellow
}

Write-Success "Installation process finished."
