# Load posh-git example profile
#. 'C:\Apps\Working\Tooling\git\modules\posh-git\profile.example.ps1'

# Chocolatey profile
#$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
#if (Test-Path($ChocolateyProfile)) {
#  Import-Module "$ChocolateyProfile"
#}

# Old
#. "C:\Apps\Working\Tooling\PowerShell\Modules\Get-ChildItem-Color\Get-ChildItem-Color.ps1"

# From https://github.com/joonro/Get-ChildItemColor
If (-Not (Test-Path Variable:PSise)) {  # Only run this in the console and not in the ISE
    Import-Module Get-ChildItemColor
    
    Set-Alias dir Get-ChildItem -option AllScope
    Set-Alias dirw Get-ChildItemColorFormatWide -option AllScope
}

# From https://github.com/dahlbyk/posh-git
Import-Module posh-git

# Old way of setting up prompt
# Set up a simple prompt, adding the git prompt parts inside git repos
#function global:prompt {
#    $realLASTEXITCODE = $LASTEXITCODE
#    Write-Host($pwd.ProviderPath) -nonewline
#    Write-VcsStatus
#    $global:LASTEXITCODE = $realLASTEXITCODE
#    return "> "
#}

# Hangs - commenting out for now...
# OK now, but doesn't work - perhaps because of path but not sure...
# Start-SshAgent -Quiet
# "C:\Program Files\git\usr\bin\ssh-agent"
# Use Git Start-SSH-Agent:
. $Env:ComSpec /c "C:\Program Files\git\cmd\start-ssh-agent.cmd"

#function Test-Administrator {
#    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
#    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
#}

#function prompt {
#    $realLASTEXITCODE = $LASTEXITCODE
#    Write-Host
#    # Reset color, which can be messed up by Enable-GitColors
#    $Host.UI.RawUI.ForegroundColor = $GitPromptSettings.DefaultForegroundColor
#    if (Test-Administrator) {  # Use different username if elevated
#        Write-Host "(Elevated) " -NoNewline -ForegroundColor White
#    }
#    Write-Host "$ENV:USERNAME@" -NoNewline -ForegroundColor DarkYellow
#    Write-Host "$ENV:COMPUTERNAME" -NoNewline -ForegroundColor Magenta
#    if ($s -ne $null) {  # color for PSSessions
#        Write-Host " (`$s: " -NoNewline -ForegroundColor DarkGray
#        Write-Host "$($s.Name)" -NoNewline -ForegroundColor Yellow
#        Write-Host ") " -NoNewline -ForegroundColor DarkGray
#    }
#    Write-Host " : " -NoNewline -ForegroundColor DarkGray
#    Write-Host $($(Get-Location) -replace ($env:USERPROFILE).Replace('\','\\'), "~") -NoNewline -ForegroundColor Blue
#    Write-Host " : " -NoNewline -ForegroundColor DarkGray
#    Write-Host (Get-Date -Format G) -NoNewline -ForegroundColor DarkMagenta
#    Write-Host " : " -NoNewline -ForegroundColor DarkGray
#    $global:LASTEXITCODE = $realLASTEXITCODE
#    Write-VcsStatus
#    Write-Host ""
#    return "> "
#}

