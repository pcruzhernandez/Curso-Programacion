$authUser    = 'student'
$authPass    = 'WS-VSCode2018'
$secpasswd   = ConvertTo-SecureString $authPass -AsPlainText -Force
$credential  = New-Object System.Management.Automation.PSCredential ($authUser, $secpasswd)

New-NavContainer -accept_eula `
                 -accept_outdated `
                 -containerName "nav-dev" `
                 -imageName "microsoft/dynamics-nav:2018-cu5-de" `
                 -licenseFile "<OutSide-Folder>\License.flf" `
                 -credential $credential `
                 -includeCSide `
                 -enableSymbolLoading `
                 -auth NavUserPassword                 