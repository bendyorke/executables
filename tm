#! /bin/bash
usage="usage: tm [-l|--list][-k|--kill|--kill-session][-K|--kill-server][-r|-n|--restart|--new][-s|--skip|--skip-command]"

base=`basename $PWD`
new_session_command="tmux -2 new-session -s $base -d && tmux send-keys $TMUX_COMMAND && tmux -2 at -t $base"
while [[ $1 = -* ]]; do
  arg=$1; shift

  case $arg in
    -l|--list)
      tmux list-sessions 2> /dev/null && exit 0 || echo "No TMUX sessions found" 1>&2 && exit 1
      ;;
    -k|--kill|--kill-session)
      tmux kill-session -t $base && exit 0
      ;;
    -K|--kill-server)
      tmux kill-server 2> /dev/null && exit 0 || echo "No running TMUX servers" 1>&2 && exit 1
      ;;
    -r|-n|--restart|--new)
      tmux kill-session -t $base
      ;;
    -h|--help)
      echo $usage && exit 0
      ;;
    -s|--skip|--skip-command)
      new_session_command="tmux -2 new-session -s $base"
      ;;
    *)
      echo "Invalid flag $arg"
      echo $usage
      exit 1
      ;;
  esac
done

tmux -2 at -t $base 2> /dev/null || eval $new_session_command
