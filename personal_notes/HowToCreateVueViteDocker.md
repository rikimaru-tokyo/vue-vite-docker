# Docker+Vite+Vueで作るフロントエンド環境


- Docker + Vite + Vue3でSPA作成
    - https://zenn.dev/c6tower/scraps/d5b82f5b6d4166

---


## フォルダ構成

```sh
./
├── Dockerfile
├── app
└── docker-compose.yml
```

---

## DockerFile

```Dockerfile
FROM node:22-alpine

WORKDIR /app

# TODO: vite project作成後、コメントアウトを外す
# COPY ./vite-project/package*.json /app/vite-project/
# WORKDIR /app/vite-project
# RUN npm install

COPY . /app

```

---

## docker-compose.yml

```yaml
services:
  vue-app:
    container_name: vue-vite-001
    build:
      context: .
      dockerfile: Dockerfile
    ports:
      - 5173:5173
    volumes:
      - .:/app
    # TODO: 下記の起動確認完了後、コメントアウトを外す(docker compose buildでリビルドしないとサーバー立ち上がらない)
    command:  sh -c "npm install && npm run dev -- --host 0.0.0.0"
    tty: true

```

---

## ビルド

```sh
$ docker compose build
$ docker compose up -d
docker exec -it sample-app sh
```

---

## ビルド後のコンテナ内での作業

```sh

# コンテナ内での作業
$ npm create vite@latest
# create-vite@6.0.1 時点の雪面
# 設問その1. プロジェクト作成を進めて良いか？
# 設問その2. プロジェクト名の入力: 今回は `vite-project`
# 設問その3. フレームワークの選択: 今回は `vue` を選択
# 設問その4. variant (js, ts, nuxt)の選択: 今回は `JavaScript` を選択

# 起動してみる
$ cd vite-project
$ npm install
$ npm run dev -- --host 0.0.0.0

```


## ビルド後の``







---

## cf. Viteの公式ドキュメント

https://ja.vite.dev/guide/




