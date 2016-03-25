GIT_COMMAND=$(echo "status\nadd\ncommit\npush\npull\nclone\nbranch\nmerge\nrebase\nreset\ninit\nhelp" | peco)

if [ $GIT_COMMAND = "commit" ]; then
  COMMIT_TYPE=$(echo "fix\nadd\nmodify" | peco)
  echo
  echo "Git Commit"
  echo
  echo "Commit Type:"$COMMIT_TYPE
  printf "Commit Message:"
  read val1
  echo

  #git commit -m \"[$COMMIT_TYPE]$val1\"
  echo "git commit -m \"[$COMMIT_TYPE]$val1\""

# 空行で終了とかでいいかも
else
  echo
fi

if [ $GIT_COMMAND = "add" ]; then
  ADD_FILE=$(echo "all" | peco)
  
  if [ $ADD_FILE = "all" ]; then
    git add .
  fi
fi

if [ $GIT_COMMAND = "push" ]; then

  git push  

fi

if [ $GIT_COMMAND = "status" ]; then

  git status

fi
