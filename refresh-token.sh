#!/bin/bash
# Power BI MCP Server Token Refresh Script
# This script refreshes the OAuth2 access token for Power BI API

CREDS_FILE="$HOME/.claude/powerbi/credentials.json"
MCP_CONFIG="$HOME/Projects/.mcp.json"

# Read credentials
CLIENT_ID=$(jq -r '.client_id' "$CREDS_FILE")
TENANT_ID=$(jq -r '.tenant_id' "$CREDS_FILE")
CLIENT_SECRET=$(jq -r '.client_secret' "$CREDS_FILE")
SCOPE=$(jq -r '.scope' "$CREDS_FILE")

# Get new access token
TOKEN_RESPONSE=$(curl -s -X POST "https://login.microsoftonline.com/$TENANT_ID/oauth2/v2.0/token" \
  -H "Content-Type: application/x-www-form-urlencoded" \
  -d "client_id=$CLIENT_ID" \
  -d "client_secret=$CLIENT_SECRET" \
  -d "scope=$SCOPE" \
  -d "grant_type=client_credentials")

ACCESS_TOKEN=$(echo "$TOKEN_RESPONSE" | jq -r '.access_token')

if [ "$ACCESS_TOKEN" != "null" ] && [ -n "$ACCESS_TOKEN" ]; then
  # Update the MCP config with new token
  jq --arg token "$ACCESS_TOKEN" \
    '.mcpServers["powerbi-remote"].headers.Authorization = "Bearer " + $token' \
    "$MCP_CONFIG" > "${MCP_CONFIG}.tmp" && mv "${MCP_CONFIG}.tmp" "$MCP_CONFIG"

  echo "✓ Token refreshed successfully"
  echo "Token expires in: $(echo "$TOKEN_RESPONSE" | jq -r '.expires_in') seconds"
else
  echo "✗ Failed to refresh token"
  echo "$TOKEN_RESPONSE" | jq '.'
  exit 1
fi
