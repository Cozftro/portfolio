#!/bin/bash

### Abracadabra
set -eu

### Varibales
declare -r SCRIPT=${0##*/}
declare -r SCRIPT_PATH=$(readlink -f ${0})
declare -r SCRIPT_DIR=${SCRIPT_PATH%/*}
declare -r LOG_DIR="${SCRIPT_DIR}/log"
declare -r LOG_NAME="$(date +%Y%m%d%H%M).log"
declare -r LOG_PATH="${LOG_DIR}/${LOG_NAME}"
declare -r help="How" 

### Function
function out_log()
{
  [[ -d ${LOG_DIR} ]] || mkdir ${LOG_DIR}
  [[ -e ${LOG_PATH} ]] || touch ${LOG_PATH}
  echo -e "$(date '+%Y-%m-%d_%H:%M:%S')_${SCRIPT}(${FUNCNAME[0]}:${BASH_LINENO})$@" >> ${LOG_PATH}
}

function confirm_args()
{
  while getopts :abc opt; do
    case $opt in
      a)
        echo "オプション -a が指定されました"
        ;;
      b)
        echo "オプション -b が指定されました"
        ;;
      c)
        echo "オプション -c が指定されました"
        ;;
      *)
        echo "オプションが正しくありません"
        ;;
    esac
  done
}  


function concentrate_task()
{
  return
}

### Main
# script開始
out_log "script開始"

# 引数チェック
confirm_args

# script完了
out_log "script実行時間${SECONDS}秒"
