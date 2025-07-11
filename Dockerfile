FROM node:22-alpine

WORKDIR /app

# TODO: vite project作成後、コメントアウトを外す
COPY ./vite-vue-project-001/package*.json /app/vite-vue-project-001/
WORKDIR /app/vite-vue-project-001
RUN npm install

COPY . /app
