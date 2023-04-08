# err -Clear
$Error.Count | Join-String -f 'had {0} errors'
$Error.Clear()
# remove-module Ninmonkey.Console
$PSStyle.OutputRendering = 'Ansi' # 'Ansi' | 'Host' | 'NoOutput' | 'PlainText'
$ModuleName = 'Pwsh.PackageTemplate'
$Harness = @{
    SourcePath = Get-Item (Join-Path $PSScriptRoot 'Source')
    OutputPath = Get-Item (Join-Path $PSScriptRoot 'Build')
    ImportMode = 'SourcePath' # [ SourcePath | OutputPath ]
}
# $Harness.ImportMode = 'OutputPath'
$Harness.ImportMode = 'SourcePath'

if ($Harness.ImportMode -eq 'Build') {
    '::always build (because we are in build mode)' | Write-Warning -wa 'Continue'
    Push-Location -stack 'harness' $Harness.SourcePath
    build
    Pop-Location -stack 'harness'
}


# $Harness.CurImportFullpath = (Join-Path $Harness.($Harness.ImportMode) 'Pwsh.PackageTemplateExample')
$harness | Format-Table -auto

Get-Command -m $ModuleName | Format-Table

return


Remove-Module $ModuleName -ea ignore

Push-Location -StackName 'harness' -Path $Harness.SourcePath
Import-Module $Harness.CurImportFullpath -Force -Verbose -PassThru

Pop-Location -StackName 'harness'
'run build script here' | Write-Warning -wa 'Continue'

"importing mode: {0}, path:`n`t{1}" -f @(
    $Harness.ImportMode
    $Harness.CurImportFullpath | Join-String -DoubleQuote
) | Write-Warning -wa 'Continue'

return


build -Verbose -ea 'break' # currently this is skippable /w ImportMode == 'SourcePath'
Pop-Location -StackName 'harness'
'run build script here' | Write-Warning -wa 'Continue'

"importing mode: {0}, path:`n`t{1}" -f @(
    $Harness.ImportMode
    $Harness.CurImportFullpath | Join-String -DoubleQuote
) | Write-Warning -wa 'Continue'




# 'see also: "https://github.com/PoshCode/Pansies/blob/main/Source/Private/_init.ps1"'
Get-Command -m $ModuleName | Sort-Object Verb, Name | Format-Table Verb, Name -AutoSize

Hr

Get-Module importexcel | Tablify.ModuleInfo
$error.Count
# $error
$error
# err -clear

Get-Command -m $ModuleName
| Sort-Object CommandType, Name
| Format-Table Name -GroupBy CommandType

# 'see also: "https://github.com/PoshCode/Pansies/blob/main/Source/Private/_init.ps1"'
Get-Command -m $ModuleName | Sort-Object Verb, Name | Format-Table Verb, Name -AutoSize

Hr

Get-Module importexcel | Tablify.ModuleInfo
