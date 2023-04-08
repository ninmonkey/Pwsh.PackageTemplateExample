## My Module

last build:
```yml
 PSVersion: 7.3.3
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


```
