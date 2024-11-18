# Update all submodules to their latest versions
param(
    [switch]$Init,
    [switch]$Force
)

$ErrorActionPreference = 'Stop'

Write-Host "Updating GT Tooling submodules..."

if ($Init) {
    Write-Host "Initializing submodules..."
    git submodule update --init --recursive
}

# Update all submodules to latest version
git submodule update --remote --merge --recursive

if ($Force) {
    Write-Host "Force resetting submodules to remote state..."
    git submodule foreach --recursive 'git reset --hard origin/$(git rev-parse --abbrev-ref HEAD)'
}

Write-Host "Submodules updated successfully!"
