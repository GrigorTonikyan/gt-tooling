# Developer Guidelines for Dev Environment Manager

## Overview

This document provides human-readable guidelines for developing and maintaining the Dev Environment Manager.
For automated tools and AI agents, refer to [ai-guidelines.md](./ai-guidelines.md).

## Development Principles

- **Cross-Platform**: Support Windows, Linux, macOS
- **Modern**: Use PowerShell 7.3+
- **Consistent**: Follow established patterns
- **Maintainable**: Clear documentation and tests

## Best Practices

### Command Line Usage

`powershell

# Use PowerShell Core (pwsh)

pwsh -NoProfile -Command "& { command }"

# Include proper error handling

try { # Your code
}
catch {
Write-Error "Failed: $\_"
}
`

### Path Handling

`powershell

# Use Join-Path for cross-platform compatibility

\ = Join-Path \X:\projects\personal\gt-tooling\dogma-enforcer 'config'
`

## Configuration

- Format: json
- Schema Validation Required: True
- Documentation Required: True

## Source of Truth

This document is generated from: ./guidelines-source.json
Updates should be made to the source file.
