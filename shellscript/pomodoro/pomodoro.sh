#!/bin/bash

### Abracadabra
set -eu

### Varibales
# Readonly
declare -r SCRIPT=${0##*/}
declare -r SCRIPT_PATH=$(readlink -f ${0})
declare -r SCRIPT_DIR=${SCRIPT_PATH%/*}
declare -r LOG_DIR="${SCRIPT_DIR}/log"
declare -r LOG_NAME="$(date +%Y%m%d%H%M).log"
declare -r LOG_PATH="${LOG_DIR}/${LOG_NAME}"
declare -r OPTERR=0
declare -r HELP="\e[34;40;1mHow To Use\e[m
[ポモドーロ]
- 1セット(Workingとbreak)
  Working:25m → break:5m → Working:25m → break:5m →
  Working:25m → break:5m → Working:25m → break:20m

- Argument
  -s required
     セット数を指定

- e.g.
  ./"${SCRIPT}" -s 2
  #セット回数2回"
declare -r INVALID_ARGS="\e[31m[Error]不適切なオプションが指定されました\e[m
${HELP}"

# Writeable
declare ARG_FLAG="false"
declare -i SET_CNT=0
declare -i NOW_SET=0

### Function
function _out_log()
{
  [[ -d ${LOG_DIR} ]] || mkdir ${LOG_DIR}
  [[ -e ${LOG_PATH} ]] || touch ${LOG_PATH}
  echo -e "$(date '+%Y-%m-%d_%H:%M:%S')_${SCRIPT}(${FUNCNAME[0]}:${BASH_LINENO})$@" >> ${LOG_PATH}
}

function _confirm_int()
{
  local -i _SET_COUNT=$1
  if [[ ${_SET_COUNT} =~ ^[0-9]+$ ]]; then
    :
  else
    zsh -c "echo -e \"${INVALID_ARGS}\""
  fi
  return
}
  
function _judge_args()
{
  if [[ "${ARG_FLAG}" = "false" ]];then
    zsh -c "echo -e \"${INVALID_ARGS}\""
    zsh -c "echo -e \"${HELP}\""
    exit 1
  fi
  return
}

function concentrate_task()
{
  local -i _NOW_CNT=${1}
  local -i _NOW_WORKING
  for j in {1..4}
  do
    _NOW_WORKING=${j}
    say "ワーキング${_NOW_WORKING}回目"
    osascript -e "display notification \"ワーキング${_NOW_WORKING}回目（${_NOW_CNT}セット）\" with title \"ポモドーロタイマー\""
    sleep 10
    if [[ ${_NOW_WORKING} -ne 4 ]];then
      say "休憩${_NOW_WORKING}回目"
      osascript -e "display notification \"休憩${_NOW_WORKING}回目（${_NOW_CNT}セット）\" with title \"ポモドーロタイマー\""
      sleep 5
    else
      say "大休憩"
      osascript -e "display notification \"大休憩（${_NOW_CNT}セット）\" with title \"ポモドーロタイマー\""
      sleep 5
    fi
  done
  return
}

### Main
# script開始
_out_log "script開始"

# 引数チェック
while getopts 's:h' OPTION ; do
  case $OPTION in
    s)
      SET_CNT=${OPTARG}
      _confirm_int ${SET_CNT}
      ARG_FLAG="true"
      ;;
    h)
      echo -e "${HELP}"
      exit 0
      ;;
    \?)
      zsh -c "echo -e \"${INVALID_ARGS}\""
      exit 1
      ;;
  esac
done

_judge_args

# pomodoro開始
for i in $(eval echo "{1..${SET_CNT}}")
do
  NOW_SET=${i}
  say "${NOW_SET}セット目Start"
  _out_log "${NOW_SET}セット目Start"
  concentrate_task ${i}
  say "${NOW_SET}セット目End"
  _out_log "${NOW_SET}セット目Start"
done

# script完了
say "ポモドーロタイマー完了"
osascript -e "display notification \"ポモドーロタイマー完了(${SET_CNT} セット）\" with title \"ポモドーロタイマー\""
_out_log "script実行時間${SECONDS}秒"
