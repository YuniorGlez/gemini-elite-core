#!/bin/bash

# browser-use Installation Script for Gemini Elite Core
# Optimized for high-reliability web automation in 2026.

set -e

CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

info() { echo -e "${BLUE}info${NC} $1"; }
success() { echo -e "${GREEN}success${NC} $1"; }
warn() { echo -e "${YELLOW}warn${NC} $1"; }

info "Checking for Python 3..."
if ! command -v python3 &> /dev/null; then
    warn "Python 3 not found. Please install Python 3 first."
    exit 1
fi

info "Checking for uv (The Fast Python Package Manager)..."
if ! command -v uv &> /dev/null; then
    info "uv not found. Installing uv..."
    if [[ "$OSTYPE" == "darwin"* ]] && command -v brew &> /dev/null; then
        brew install uv
    else
        curl -LsSf https://astral.sh/uv/install.sh | sh
    fi
    # Add to path for current session
    export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.astral-uv/bin:$PATH"
fi

if ! command -v uv &> /dev/null; then
    warn "uv installation failed or not in PATH. Falling back to pip..."
    INSTALL_CMD="pip3 install"
else
    INSTALL_CMD="uv pip install"
fi

info "Installing browser-use and playwright..."
$INSTALL_CMD browser-use playwright --break-system-packages &> /dev/null || $INSTALL_CMD browser-use playwright &> /dev/null

info "Installing Playwright browsers (Chromium)..."
if command -v uv &> /dev/null; then
    uv run playwright install chromium &> /dev/null || playwright install chromium &> /dev/null
else
    playwright install chromium &> /dev/null
fi

# Check if browser-use command works
if command -v browser-use &> /dev/null; then
    success "browser-use CLI installed successfully!"
    browser-use --version
else
    # Try finding it in local bin
    if [ -f "$HOME/.local/bin/browser-use" ]; then
        success "browser-use CLI installed in $HOME/.local/bin/"
    else
        warn "browser-use installed but CLI not found in PATH."
    fi
fi

info "Remember to set BROWSER_USE_API_KEY for cloud browser support."
success "Installation complete!"
