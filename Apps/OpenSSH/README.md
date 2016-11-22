Important Notes

PowerShell OpenSSH won't read from "\Program Files\OpenSSH\ssh_config" - instead you need to
create a config file in \Users\<username>\.ssh or create a link to the system file:
cd \Users\<username>\.ssh
mklink config "\Program Files\OpenSSH\ssh_config"

