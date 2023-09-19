git add ./_vimrc
git add ./git_push.ps1
$commit_info=Read-Host -Prompt "input commit info"
git commit -m $commit_info
git push
