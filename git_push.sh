git add _vimrc
git add *.ps1
git add *.sh
read -p "input commit info:" commit_info
echo $commit_info
git commit -m $commit_info
git push
