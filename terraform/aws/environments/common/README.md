# 概要
tfstate格納用のs3バケット構築ルートモジュール

## 事前作業
* provider設定<br>`~/.aws/`フォルダへ事前に設定ファイルを配備
  * backend.tfに記載されているprovider
    * backendを構築する当該ディレクトリでは非指定
  * provider.tfに記載されているprovider 
* terraformバージョンインストール
  * `versions.tf`の必要バージョンをインストール
    * `tfenv list`
      * 存在しない場合`tfenv install 必要バージョン`
    * `tfenv use 必要バージョン`

## デプロイ
```
terraform init
terraform plan -target=module.tfstate_bucket
terraform apply -target=module.tfstate_bucket
```

## 構成ファイル
| ファイル名 | 用途 |
| ---- | ---- |
| main.tf | サービスモジュールをインスタンス化ファイル |
| variables.tf | 変数定義用ファイル |
| terraform.tfvars | 変数値格納ファイル(examplesにサンプル)|
| backend.tf | tfstate格納指定ファイル |
| provider.tf | provider指定ファイル |
| versions.tf | terraformバージョン指定ファイル |

## リソース

| Name | Type |
|------|------|
| [aws_s3_bucket.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.backend](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |

## 変数

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_bucket"></a> [bucket](#input\_bucket) | backend用s3バケットの変数群 | `map` | n/a | yes |