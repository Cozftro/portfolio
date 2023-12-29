#!/bin/bash

### おまじない
set -eu
trap escape_script EXIT

### Variavles
### Functions
function escape_script()
{
  echo "しっぱいしました"
  return
}

### Main
echo "Start_$(date +%Y%m%d%H%M%S)"
false
echo "Fnished_$(date +%Y%m%d%H%M%S)"
trap EXIT
