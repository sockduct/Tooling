# Load posh-git example profile
#. 'C:\apps\working\Tooling\git\posh-git\profile.example.ps1'

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

. "C:\Apps\Working\Tooling\PowerShell\Get-ChildItem-Color\Get-ChildItem-Color.ps1"
Set-Alias l Get-ChildItem-Color -option AllScope -Force
Set-Alias dir Get-ChildItem-Color -option AllScope -Force
Set-Alias ls Get-ChildItem-Format-Wide -option AllScope -Force

Import-Module posh-git

# Set up a simple prompt, adding the git prompt parts inside git repos
function global:prompt {
    $realLASTEXITCODE = $LASTEXITCODE
    Write-Host($pwd.ProviderPath) -nonewline
    Write-VcsStatus
    $global:LASTEXITCODE = $realLASTEXITCODE
    return "> "
}

# Hangs - commenting out for now...
# Start-SshAgent -Quiet
"C:\Program Files\git\usr\bin\ssh-agent"

function Test-Administrator {
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

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

