#!/bin/bash
# Power BI MCP Auto Token Refresh Script
# Checks MCP connection status and refreshes token if authentication fails

set -e

SCRIPT_DIR="$HOME/.claude/powerbi"
REFRESH_SCRIPT="$SCRIPT_DIR/refresh-token.sh"
LOG_FILE="$SCRIPT_DIR/token-refresh.log"
MCP_CONFIG="$HOME/Projects/.mcp.json"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log() {
    echo "[$(date +'%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Check if MCP server is connected
check_mcp_status() {
    local status=$(claude mcp list 2>&1 | grep "powerbi-remote" || echo "")

    if echo "$status" | grep -q "✔ Connected"; then
        return 0  # Connected
    elif echo "$status" | grep -q "✘ Failed"; then
        return 1  # Failed
    else
        return 2  # Unknown status
    fi
}

# Refresh the token
refresh_token() {
    log "🔄 Attempting to refresh Power BI token..."

    if [ ! -f "$REFRESH_SCRIPT" ]; then
        log "❌ ERROR: Refresh script not found at $REFRESH_SCRIPT"
        return 1
    fi

    # Run the refresh script
    if bash "$REFRESH_SCRIPT" >> "$LOG_FILE" 2>&1; then
        log "✅ Token refreshed successfully"
        return 0
    else
        log "❌ Failed to refresh token"
        return 1
    fi
}

# Main logic
main() {
    log "🔍 Checking Power BI MCP connection status..."

    if check_mcp_status; then
        log "✅ Power BI MCP is connected - no action needed"
        exit 0
    else
        log "⚠️  Power BI MCP connection failed - refreshing token..."

        if refresh_token; then
            echo ""
            echo -e "${GREEN}✅ Token refreshed successfully!${NC}"
            echo -e "${YELLOW}⚠️  Please reload VSCode window to reconnect:${NC}"
            echo -e "   ${YELLOW}Cmd+Shift+P → 'Developer: Reload Window'${NC}"
            echo ""
            exit 0
        else
            echo ""
            echo -e "${RED}❌ Failed to refresh token${NC}"
            echo -e "Check logs at: $LOG_FILE"
            echo ""
            exit 1
        fi
    fi
}

# Run main function
main "$@"
