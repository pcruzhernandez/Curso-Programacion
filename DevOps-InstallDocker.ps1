Install-Module -Name DockerMsftProvider -Repository PSGallery -Force
Install-Package -Name docker -ProviderName DockerMsftProvider
Restart-Computer -Force

##### Nav-ContainerHelper

Install-Module navcontainerhelper -force

New-CSideDevContainer -accept_eula -containerName "nav-dev" -auth NavUserPassword -imageName "microsoft/bcsandbox:de" -doNotExportObjectsToText