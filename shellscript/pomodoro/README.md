# 概要
シェルスクリプトでポモドーロタイマーを作成<br>
※ mac環境(macチップ)でのみ稼働

## 🌵挙動
1. スクリプト実行
1. set開始通知（音声）
1. ワーキング(音声&ディスプレイ通知)
1. 休憩(音声&ディスプレイ通知)
1. ワーキングの4回目まで完了したら、大休憩(音声&ディスプレイ通知)
1. set完了通知（音声）
1. 次セットがあればループ
1. 次セットが無ければ完了（音声）

## 🌵使い方
```
$ bash pomodoro.sh -h
How To Use
[ポモドーロ]
- 1セット(Workingとbreak)
  Working:25m → break:5m → Working:25m → break:5m →
  Working:25m → break:5m → Working:25m → break:20m

- Argument
  -s required
     セット数を指定
  -h
     help表示

- e.g.
  ./pomodoro.sh -s 2
  #セット回数2回
```

## 🌵動作環境
### CPU
```
$ sysctl machdep.cpu.brand_string
machdep.cpu.brand_string: Apple M1
```
### zsh
```
$ /bin/zsh --version
zsh 5.8.1 (x86_64-apple-darwin22.0)
```
### bash
```
$ /bin/bash --version
GNU bash, version 3.2.57(1)-release (arm64-apple-darwin22)
Copyright (C) 2007 Free Software Foundation, Inc.
```


## 🌵履歴
2024/1/8 新規構築
2024/1/25 α版リリース
