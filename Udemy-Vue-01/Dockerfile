FROM node:22-alpine

WORKDIR /app

# TODO: vite project作成後、コメントアウトを外す
COPY ./udemy-001/package*.json /app/udemy-001/
WORKDIR /app/udemy-001
RUN npm install

COPY . /app
