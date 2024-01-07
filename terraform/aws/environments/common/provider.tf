# profileは各環境の.aws/設定に依存する
provider "aws" {
  region  = "ap-northeast-1"
  profile = "terraformer"
  default_tags {
    tags = {
      terraform = "yes"
    }
  }
}
