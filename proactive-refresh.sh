#!/bin/bash
# Proactive Power BI Token Refresh Script
# Refreshes token before it expires (tokens last ~1 hour)
# Run this every 50 minutes to ensure token never expires

set -e

SCRIPT_DIR="$HOME/.claude/powerbi"
REFRESH_SCRIPT="$SCRIPT_DIR/refresh-token.sh"
LOG_FILE="$SCRIPT_DIR/token-refresh.log"

log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

log "🔄 Proactive token refresh starting..."

if [ ! -f "$REFRESH_SCRIPT" ]; then
    log "❌ ERROR: Refresh script not found at $REFRESH_SCRIPT"
    exit 1
fi

# Run the refresh script
if bash "$REFRESH_SCRIPT" >> "$LOG_FILE" 2>&1; then
    log "✅ Proactive token refresh completed successfully"
    log "ℹ️  VSCode will pick up new token on next MCP server reconnect"
    exit 0
else
    log "❌ Proactive token refresh failed - check logs"
    exit 1
fi
