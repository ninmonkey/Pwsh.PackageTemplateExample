## My Module

last build:
```yml
~~~pipescript{
(Get-Date).ToString('o') | Join-String 'LastUpdated: '
$PSVersionTable.PSVersion.ToString() | Join-String -op 'PSVersion: '
}~~~
```

## Functions

```ps1
~~~pipescript{
Gcm -m ExcelAnt | sort-object Name | ft 
}~~~
```