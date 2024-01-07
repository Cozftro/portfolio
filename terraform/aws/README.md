# 🏝️概要
AWSリソースterraform構築ディレクトリ

## 🌵ディレクトリ構造
```
.
├── CODEOWNERS
├── README.md
├── environments
│   └── dev
└── modules
    ├── backend
    └── service
```

## 🌵aws_providerバージョン
5.31.0

## 🌵tags
providerにて設定する必須タグ
| key | value |
| ---- | ----|
| terraform | yes |

## 🌵留意事項
remoteへpushする前に下記コマンドを実施すること
```
# terraformコードのフォーマット
terraform fmt

# terraformコードのコード検証
terraform validate
```

## 🌵~/.awsについて
下記クレデンシャルについては適宜個人環境にて配備する
```
~/.aws/config
~/.aws/credentials
```
