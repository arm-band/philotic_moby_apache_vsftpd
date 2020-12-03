# Docker Ansible test

## Abstract

Ansibleコントロールノード を Dockerコンテナ として構築するテストです。

## Usage

`git clone`

### Prepare

1. `workspace/entrypoint.sh` の `FILENAME` と `PUBFILENAME` の値を変更してください
2. `workspace/hosts` にリモートサーバのIP or ホスト名を既述してください
3. `get_packages.yml` の `become_user` を本来の管理者ユーザの名前に変更してください

### Usage

1. `docker-compose up -d`
2. `docker-compose exec ansible /bin/bash`
3. 1.で作成された公開鍵をリモートサーバに送り込んでください
4. `ansible-playbook -i /workspace/ansible/targets/hosts /workspace/ansible/main.yml -u SSH_REMOTEUSER --private-key="/root/.ssh/PRIVATE_KEY" -K`

### Finish

1. `docker-compose down`

---

以上