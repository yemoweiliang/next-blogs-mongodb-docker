FROM node:12-alpine AS app-base
RUN ["npm","install","--registry=http://mirrors.cloud.tencent.com/npm/","-g","nodemon","forever","node-gyp"]
RUN mkdir -p /app
WORKDIR /app
COPY package*.json ./
#RUN   npm install --registry=http://mirrors.cloud.tencent.com/npm/
RUN npm_config_sharp_binary_host=https://npm.taobao.org/mirrors/sharp npm_config_sharp_libvips_binary_host=https://npm.taobao.org/mirrors/sharp-libvips npm install --registry=http://mirrors.cloud.tencent.com/npm/
COPY . .
RUN npm run build
EXPOSE 5001
CMD  npm run docker