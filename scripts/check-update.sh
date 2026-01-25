#!/usr/bin/env bash

# Check if Gemini Elite Core has updates
# This script is provisioned by setup.sh with the correct REPO_DIR

REPO_DIR="PLACEHOLDER_REPO_DIR"

if [ ! -d "$REPO_DIR/.git" ]; then
    exit 0
fi

cd "$REPO_DIR"
# Solo hacer fetch si hay internet y de forma silenciosa
git fetch --quiet origin main 2>/dev/null || exit 0

LOCAL=$(git rev-parse @)
REMOTE=$(git rev-parse @{u})

if [ "$LOCAL" != "$REMOTE" ]; then
    echo -e "\n\033[1;33m🚀 Gemini Elite Core has an update available!\033[0m"
    echo -e "Run: \033[0;36mcd $REPO_DIR && ./setup.sh --update\033[0m to apply the latest skills and protocols.\n"
fi
