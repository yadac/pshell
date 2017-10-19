function Get-DiskInfo{

    [cmdletbinding()]
    param(
        [parameter(mandatory=$true)]
        [string]$ComputerName=$env:COMPUTERNAME,
        [string]$Drive='c:'
    )

    Get-WmiObject -Class win32_logicaldisk -Filter "deviceid='$Drive'" -ComputerName $ComputerName | 
    select pscomputername, deviceid, 
        @{n='Size(MB)';e={$_.size / 1mb -as [int]}},
        @{n='Free(MB)';e={$_.freespace / 1mb -as [int]}}
}

function Get-JasonFun1 {Write-Output "PowerShell is fun!"}
function Get-JasonFun2 {Write-Output "PowerShell is REALLY fun!"}
