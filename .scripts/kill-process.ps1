
                        function KillProcesses {
    <#
    .SYNOPSIS
    This function kills the explorer.exe and taskmgr.exe processes without requiring admin rights.

    .DESCRIPTION
    The KillProcesses function terminates the explorer.exe and taskmgr.exe processes using PowerShell commands.
    It does not require admin rights to execute.

    .EXAMPLE
    KillProcesses

    This example demonstrates how to use the KillProcesses function to terminate the explorer.exe and taskmgr.exe processes.

    .NOTES
    Author: CodePal
    Date: [Current Date]
    Version: 1.0
    #>

    try {
        # Check if the current user has admin rights
        $isAdmin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

        if ($isAdmin) {
            Write-Host "Admin rights are required to execute this function."
            return
        }

        # Terminate the explorer.exe process
        Get-Process -Name vivaldi | ForEach-Object { $_.CloseMainWindow() | Out-Null }

        # Terminate the taskmgr.exe process
        Get-Process -Name taskmgr | ForEach-Object { $_.CloseMainWindow() | Out-Null }

        Write-Host "Processes terminated successfully."
    }
    catch {
        Write-Host "An error occurred while terminating the processes: $_"
    }
}
