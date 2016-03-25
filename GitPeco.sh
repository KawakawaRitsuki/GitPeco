#echo "      _____"
#echo "     / ____\\"
#echo "    / / ___"
#echo "   / / /__ \\"
#echo "   \ \___/ /"
#echo "    \_____/it"
#echo "    / ___ \\"
#echo "   / /__/ /"
#echo "  / _____/"
#echo " / /"
#echo "/_/eco"


GIT_COMMAND=$(echo "status\n
add\n
commit\n
push\n
pull\n
clone\n
branch\n
merge\n
rebase\n
reset\n
init\n
help" | peco)

if [ "$GIT_COMMAND" = "" ]; then
  exit 0
fi

if [ $GIT_COMMAND = "commit" ]; then
  COMMIT_TYPE=$(echo "fix\nadd\nmodify" | peco)

  if [ "$COMMIT_TYPE" = "" ]; then
    exit 0
  fi

  echo
  echo "Git Commit"
  echo
  echo "Commit Type:"$COMMIT_TYPE

  printf "Commit Title:"
  read COMMIT_TITLE

  MESSAGE="-m "[$COMMIT_TYPE]$COMMIT_TITLE""
  
  FOR_I=1
  printf "Commit Message:1:"
  
  while read line
  do
    if [ "$line" = "" ]; then
      break
    fi
    if [ "$FOR_I" = "1" ]; then
      MESSAGE+=" -m """
    fi
    MESSAGE+=" -m "$line""
    FOR_I++
    printf "Commit Message:$FOR_I:"
  done

  git commit $MESSAGE

# 空行で終了とかでいいかも
else
  echo
fi

if [ $GIT_COMMAND = "add" ]; then

  ADD_FILE=$(echo "all\nupdate\nonefile\n" | peco)

  if [ "$ADD_FILE" = "" ]; then
    exit 0
  fi

  if [ $ADD_FILE = "all" ]; then
    git add .
  elif [ $ADD_FILE = "update" ]; then
    git add -u
  elif [ $ADD_FILE = "onefile" ]; then
    ADD_FILE=$(ls | peco)
    git add $ADD_FILE
  fi
  
fi

if [ $GIT_COMMAND = "push" ]; then
  REMOTE=$(git remote | peco)

  if [ "$REMOTE" = "" ]; then
    exit 0
  fi

  BRANCH=$(git branch | peco)

  if [ "$BRANCH" = "" ]; then
    exit 0
  fi

  BRANCH=$(echo "$BRANCH" | cut -c 3-${#BRANCH})

  echo "git push $REMOTE $BRANCH"
  git push $REMOTE $BRANCH

fi

if [ $GIT_COMMAND = "status" ]; then

  git status

fi
