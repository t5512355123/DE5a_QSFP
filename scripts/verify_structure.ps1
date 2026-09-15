$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $PSScriptRoot
$required = @(
    'README.md',
    'STATUS.md',
    'CHANGELOG.md',
    'docs\experiment-log.md',
    'docs\architecture.md',
    'docs\verification-matrix.md',
    'docs\presentation-index.md',
    'docs\source-provenance.md',
    'docs\figures\rate-path.mmd',
    'src\quartus\week01\QSFP_TX_RX\QSFP_TX_RX.qpf',
    'src\quartus\week02\QSFP_\QSFP.qpf',
    'src\quartus\week03\QSFP_4PORT\QSFP_4PORT.qpf',
    'src\quartus\week03\QSFP_JTAG\QSFP.qpf',
    'docs\presentations\week01\QSFP-4-10.pptx',
    'docs\presentations\week02\QSFP-4-17.pptx',
    'docs\presentations\week02\QSFP-4-17.pdf',
    'docs\presentations\week03\QSFP-4-24.pptx'
)

$missing = @(
    $required |
    Where-Object { -not (Test-Path -LiteralPath (Join-Path $root $_)) }
)

if ($missing.Count -gt 0) {
    Write-Error ('Missing required paths: ' + ($missing -join ', '))
}

$projects = @(
    Get-ChildItem -LiteralPath (Join-Path $root 'src\quartus') -Recurse -File -Filter '*.qpf'
)
$presentations = @(
    Get-ChildItem -LiteralPath (Join-Path $root 'docs\presentations') -Recurse -File
)
$gitRoot = Join-Path $root '.git'
$stagingRoot = Join-Path $root '_staging'
$files = @(
    Get-ChildItem -LiteralPath $root -Recurse -File -Force |
    Where-Object {
        $_.FullName -notlike ($gitRoot + '\*') -and
        $_.FullName -notlike ($stagingRoot + '\*')
    }
)

Write-Output ('OK: required paths = ' + $required.Count)
Write-Output ('OK: Quartus projects = ' + $projects.Count)
Write-Output ('OK: presentation files = ' + $presentations.Count)
Write-Output ('OK: total files in complete local snapshot = ' + $files.Count)
