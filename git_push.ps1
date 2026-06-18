git add _vimrc
git add *.ps1
git add *.sh
git add *.md
$commit_info=Read-Host -Prompt "input commit info"
git commit -m $commit_info
git push
