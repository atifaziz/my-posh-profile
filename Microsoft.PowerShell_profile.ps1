$here = Split-Path -Parent $MyInvocation.MyCommand.Path

$funcsDir = Join-Path $here functions
if (Test-Path $funcsDir)
{
    Resolve-Path (Join-Path $funcsDir *.ps1) |
        ? { $_.ProviderPath -notmatch '\bTests\.' } |
        % { . $_.ProviderPath }
}

function which($name) { Get-Command $name | select Definition }
function rm-rf($item) { Remove-Item -Recurse -Force $item }
function touch($file) { New-Item -ItemType File $file }
