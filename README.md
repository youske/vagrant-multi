vagrant-multi
=============

# 概要
複数台構成の仮想マシンの構成を行うVagrantfile

開発初期段階の"とりあえずサーバ"を構築するための設定ファイルとしています。

vagrant boxファイルはAtlasよりダウンロードして実行する。
https://atlas.hashicorp.com/youske/boxes/debian-jessie

*現時点ではdebian-jessieを利用しています。


# 内容

* bootstrap.sh <- プロビジョニング（といっても、簡単なソフトウェアのインストールだけ）
* machines.rb <- 仮想マシンの設定ファイル
* Vagrantfile <- Vagrant環境ファイル


# 利用方法

1. machines.rbファイルを編集し、必要な台数のマシンの設定を記述
2. bootstrap.shを編集し該当ロールのマシンに入れたいソフトを設定
3. vagrant upにてセットアップ


# その他

## machens.rb
上から順番に設定される。
private_ipaddr => ( "192.168.33.20" ) + (0 >> 1 )

## bootstrap.sh
シェルスクリプトを実行する。特に制限なし
