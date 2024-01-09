#!/bin/bash

declare -r COLOR="\e[31m文字列（文字色）\e[m"
declare -r SHADOW="\e[;41m文字列（背景色）\e[m"
declare -r BOLD="\e[;;1m文字列（太字）\e[m"
declare -r UNDER="\e[;;4m文字列（アンダーライン）\e[m"
declare -r FLASH="\e[;;5m文字列（点滅）\e[m"
declare -r TEPLATE="\e[32;44;1m文字列（色・背景・太字）\e[m"

echo -e "文字列（通常のecho）"
echo -e "${COLOR}"
echo -e "${SHADOW}"
echo -e "${BOLD}"
echo -e "${UNDER}"
echo -e "${FLASH}"
echo -e "${TEPLATE}"
