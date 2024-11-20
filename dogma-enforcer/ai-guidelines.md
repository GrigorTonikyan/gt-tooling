# AI Agent Guidelines for Dev Environment Manager

## IMPORTANT INSTRUCTIONS FOR AI AGENTS

This document is specifically formatted for AI language models and code generation agents. Follow these rules strictly when generating or modifying code for this project.

## COMMAND GENERATION RULES

ALWAYS:
pwsh
-NoProfile
Use: Explicit parameter names

NEVER USE:
✗ powershell
✗ PowerShell.exe

## CODE GENERATION REQUIREMENTS

MANDATORY:

1. PowerShell 7.3+ syntax only
2. Type declarations for ALL parameters
3. PowerShell approved verbs only
4. Comment-based help blocks
5. Platform-agnostic paths

## FUNCTION TEMPLATE - ALWAYS USE THIS STRUCTURE

`powershell
<#
.SYNOPSIS
[REQUIRED] One-line description
.DESCRIPTION
[REQUIRED] Detailed description
.PARAMETER ParameterName
[REQUIRED] Parameter description
.EXAMPLE
[REQUIRED] Usage example
#>
function Verb-Noun {
[CmdletBinding()]
param(
[Parameter(Mandatory)]
[type]
)

    begin {
        Write-Verbose "Starting Verb-Noun"
    }

    process {
        try {
            # Main logic here
        }
        catch {
            Write-Error -ErrorRecord
            throw
        }
    }

    end {
        Write-Verbose "Completed Verb-Noun"
    }

}
`

## VALIDATION CHECKLIST

Before generating/modifying code, verify:

- [ ] pwsh usage
- [ ] type declarations
- [ ] approved verbs
- [ ] help documentation
- [ ] platform-agnostic paths
- [ ] error handling
- [ ] logging
- [ ] verbose output
- [ ] parameter validation

## VERSION COMPATIBILITY

SUPPORTED:

- PowerShell: 7.3+
- Platforms: Windows, Linux, macOS
- Features: modern cmdlets, cross-platform

## SOURCE OF TRUTH

This document is generated from: ./guidelines-source.json
DO NOT modify this file directly. Update the source file instead.
