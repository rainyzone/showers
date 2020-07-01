#/usr/env/bin bash

# set -x
set -e

get_git_remote() {
  path="$1/.git"
  if [ -d $path ]; then
    origin_info=$(git -C $1 remote -v | awk '{split($0,line," ");print line[1]" "line[2]}' | uniq)
    echo $origin_info
  fi
}

sync_code() {
  CODE_DIR=$1

  code_directories=$(ls $CODE_DIR)

  OLD_IFS="$IFS"
  IFS="  "
  arr=($code_directories)
  IFS="$OLD_IFS"

  for d in ${arr[@]}
  do
    local path="$(pwd)/$d"
    if [ -d $path ]; then
      get_git_remote $path
    fi
  done
}

main() {
  case $1 in
    git) sync_code $2 ;;
    *) echo "Please input validate command." ;;
  esac
}

main $@
