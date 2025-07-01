# MCP Servers Configuration

Configuration for Model Context Protocol (MCP) servers used with Claude Code.

## filesystem
```json
"filesystem": {
  "command": "npx",
  "args": [
    "-y",
    "@modelcontextprotocol/server-filesystem",
    "/home/bobparsons/Development/",
    "/home/bobparsons/dotfiles/"
  ]
}
```

## fetch
```json
"fetch": {
  "command": "docker",
  "args": [
    "run",
    "-i",
    "--rm",
    "mcp/fetch"
  ]
}
```

## memory
```json
"memory": {
  "command": "docker",
  "args": [
    "run",
    "-i",
    "-v",
    "claude-memory:/app/dist",
    "--rm",
    "mcp/memory"
  ]
}
```

## sequentialthinking
```json
"sequentialthinking": {
  "command": "docker",
  "args": [
    "run",
    "--rm",
    "-i",
    "mcp/sequentialthinking"
  ]
}
```

## Usage

Add these configurations to the `mcpServers` section of your `~/.claude.json` file:

```json
{
  "mcpServers": {
    // Add the above server configurations here
  }
}
```