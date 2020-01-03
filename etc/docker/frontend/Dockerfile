# build-stage
FROM node:12.7.0-alpine as build-stage

WORKDIR /app
COPY ./frontend/package.json ./frontend/yarn.lock 
# ./frontend/webpack* ./
RUN yarn install
COPY ./frontend/ ./
# RUN yarn build
# CMD ["yarn", "build", "-d", "--watch"]


# production-stage
FROM node:12.7.0-alpine as production-stage

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

WORKDIR /app

# system update
RUN apk update && \
  apk add -y vim less

# install yarn command.
RUN apk add yarn

# copy application code from host.
ADD frontend /app
RUN yarn add nuxt

EXPOSE 3333
CMD ["yarn", "run", "dev"]