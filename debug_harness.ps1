# err -Clear
$Error.Count | Join-String -f 'had {0} errors'
$Error.Clear()
# remove-module Ninmonkey.Console
$PSStyle.OutputRendering = 'Ansi' # 'Ansi' | 'Host' | 'NoOutput' | 'PlainText'
$Harness = @{
    SourcePath = Get-Item (Join-Path $PSScriptRoot 'Source')
    OutputPath = Get-Item (Join-Path $PSScriptRoot 'Output')
    ImportMode = 'SourcePath' # [ SourcePath | OutputPath ]
}
# $Harness.ImportMode = 'OutputPath'
$Harness.ImportMode = 'SourcePath'
$Harness.CurImportFullpath = (Join-Path $Harness.($Harness.ImportMode) 'Pwsh.PackageTemplateExample')
$harness | ft -auto

return


Remove-Module 'Pwsh.PackageTemplate' -ea ignore

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
Get-Command -m Pwsh.PackageTemplate | Sort-Object Verb, Name | Format-Table Verb, Name -AutoSize

Hr

Get-Module importexcel | Tablify.ModuleInfo
$error.Count
# $error
$error
# err -clear

Get-Command -m Pwsh.PackageTemplate
| Sort-Object CommandType, Name
| Format-Table Name -GroupBy CommandType

# 'see also: "https://github.com/PoshCode/Pansies/blob/main/Source/Private/_init.ps1"'
Get-Command -m Pwsh.PackageTemplate | Sort-Object Verb, Name | Format-Table Verb, Name -AutoSize

hr

get-module importexcel | Tablify.ModuleInfo
