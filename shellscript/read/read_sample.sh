#!/bin/bash

### おまじない
set -e

### Variavles
declare INPUT_STREAM
declare INPUT_STREAM_SECRET

### Functions
### Main
# 通常のインプット
read -p 'Input something : ' INPUT_STREAM
echo -e "${INPUT_STREAM}\n"

# 非表示でインプット
read -s -p 'Input secret : ' INPUT_STREAM_SECRET
echo -e "\n${INPUT_STREAM_SECRET}"
