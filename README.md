# Philotic Moby

## Abstract

Ansible コントロールノード を Dockerコンテナ として構築し、 RedHat系OS サーバに Apache の仮想ホストの追加と vsftpd のユーザを作成を行うプレイブックです。

## Usage

`git clone https://github.com/arm-band/philotic_moby_apache_vsftpd`

### Prepare

1. `sample.env` をコピーして `.env` を作成し、中のパラメータを編集してください
2. `ansible/targets/hosts.sample` をコピーして `ansible/targets/hosts` を作成し、リモートサーバのIP or ホスト名を記述してください
3. `ansible/vars/param_vars.yml` をコピーして `ansible/vars/param_vars.yml` を作成し、中のパラメータを編集してください

### Usage

1. `docker-compose up -d`
2. `docker-compose exec ansible /bin/bash`
3. 1.で作成された公開鍵をリモートサーバに送り込んでください
4. `ansible-playbook -i /ansible/targets/hosts /ansible/main.yml -u SSH_REMOTEUSER --private-key="/root/.ssh/KEY_NAME" -K` (`SSH_REMOTEUSER`, `KEY_NAME` は実際の値に置き換えてください)
    - または、 `/command_ansible/` に上述コマンドのショートカットを生成するので、 `/command_ansible/ansible_do.sh` とすれば実行できます
    - DryRun 用の `/command_ansible/ansible_test.sh` もあります

### Finish

1. `docker-compose down`

---

以上