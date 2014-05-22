#! /bin/bash
usage="usage: tm [-l][-k][-r|-n]"

base=`basename $PWD`
while [[ $1 = -* ]]; do
  arg=$1; shift

  case $arg in
    -l)
      tmux list-sessions 2> /dev/null && exit 0 || echo "No TMUX sessions found" 1>&2 && exit 1
      ;;
    -k)
      tmux kill-session -t $base && exit 0
      ;;
    -K)
      tmux kill-server && exit 0
      ;;
    -r|-n)
      tmux kill-session -t $base
      ;;
    -h)
      echo $usage && exit 0
      ;;
    *)
      echo "Invalid flag $arg"
      echo $usage
      exit 1
      ;;
  esac
done

tmux -2 at -t $base 2> /dev/null || tmux -2 new-session -s $base
