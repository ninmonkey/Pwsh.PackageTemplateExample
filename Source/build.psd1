# This  ModuleBuilder, not Invoke-Build
@{
    ModuleManifest = "Pwsh.PackageTemplate.psd1"
    # The rest of the paths are relative to the manifest
    OutputDirectory = "..\Output"
}


# PS > Build-Module -Suffix "Export-ModuleMember -Function *-* -Variable PreferenceVariable"
