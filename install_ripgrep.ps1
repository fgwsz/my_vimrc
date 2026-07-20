Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
# irm get.scoop.sh | iex
irm https://gitee.com/scoop-installer/install/raw/master/install.ps1 | iex
scoop install ripgrep
