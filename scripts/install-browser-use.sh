#!/bin/bash

# browser-use Installation Script for Gemini Elite Core
# Optimized for high-reliability web automation in 2026.
# Fix: Forces Python 3.12 via uv to ensure compatibility with browser-use.

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
    curl -LsSf https://astral.sh/uv/install.sh | sh
    export PATH="$HOME/.cargo/bin:$HOME/.local/bin:$HOME/.astral-uv/bin:$PATH"
fi

# El corazón del arreglo: Forzar Python 3.12
info "Ensuring Python 3.12 is available via uv..."
uv python install 3.12

if command -v uv &> /dev/null; then
    info "Installing browser-use via uv tool (Python 3.12 isolated)..."
    # Forzamos a que el tool use Python 3.12 específicamente
    uv tool install browser-use --python 3.12 --force
    
    info "Installing Playwright browsers..."
    uv run --python 3.12 --with playwright playwright install chromium
else
    # Fallback si uv falla (aunque uv python install debería haber funcionado)
    warn "uv exists but had issues. Trying system fallback (unreliable for <3.11)..."
    pip3 install browser-use playwright --break-system-packages
    python3 -m playwright install chromium
fi

# Ensure common local bin paths are in PATH for this check
export PATH="$HOME/.local/bin:$HOME/Library/Python/$(python3 -c 'import sys; print(f"{sys.version_info.major}.{sys.version_info.minor}")')/bin:$PATH"

if command -v browser-use &> /dev/null; then
    success "browser-use CLI installed successfully!"
else
    warn "browser-use installed but CLI not found in PATH."
    echo -e "${YELLOW}Hint: Add this to your .zshrc:${NC}"
    echo 'export PATH="$HOME/.local/bin:$PATH"'
fi

success "Installation process finished."
