git add _vimrc
git add *.ps1
git add *.sh
git add *.md
read -p "input commit info:" commit_info
git commit -m "$commit_info"
git push
