## My Module

last build:
```yml
~~~pipescript{
(Get-Date).ToString('o') | Join-String 'LastUpdated: '
$PSVersionTable.PSVersion.ToString() | Join-String -op 'PSVersion: '
}~~~
```

### To build: Module

```ps1
cd ./Source
build
popd
```
## To Run

```ps1
. debug_harness.ps1 # * mostly.
```

### To build: using SourceGenerators

```ps1
Pushd -path $PSScriptRoot
Import-Module PipeScript -passthru -ea stop
Export-Pipescript
popd
```


## Commands

```ps1
~~~pipescript{
Gcm -m ExcelAnt | sort-object Name | ft 
}~~~
```