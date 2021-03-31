$ContainerName = 'bcserverx'

& (Join-Path -Path $PSScriptRoot -ChildPath 'Install-BCContainerHelper.ps1')

Write-Host '###### Create Container with Artifacts ######' -ForegroundColor Blue

New-BCContainer -accept_eula `
    -containerName $ContainerName `
    -artifactUrl (Get-BCArtifactUrl -type OnPrem -version 17.2 -country w1) `
    -auth Windows `
    -updateHosts `
    -isolation hyperv