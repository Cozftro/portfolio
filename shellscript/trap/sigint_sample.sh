#!/bin/bash

### おまじない
set -eu
trap escape_script SIGINT

### Variavles
### Functions
function escape_script()
{
  echo "しっぱいしました"
  return
}

### Main
echo "Start_$(date +%Y%m%d%H%M%S)"
wait $(sleep 10)
echo "Fnished_$(date +%Y%m%d%H%M%S)"
trap EXIT
