# build-stage
FROM node:12.7.0-alpine as build-stage

WORKDIR /app
COPY ./frontend/package.json /app
COPY ./frontend/yarn.lock /app

RUN yarn install
COPY frontend/ /app


# development-stage
FROM node:12.7.0-alpine as development-stage

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

WORKDIR /app

# system update
# RUN apk update && \
  # apk add vim less yarn

ADD frontend /app
RUN yarn add nuxt

EXPOSE 3333
CMD ["yarn", "run", "dev"]


# production-stage
FROM node:12.7.0-alpine as production-stage

ENV LANG C.UTF-8
ENV TZ Asia/Tokyo

WORKDIR /app

# system update
# RUN apk update && \
  # apk add vim less yarn

ADD frontend /app
RUN yarn add nuxt
RUN yarn nuxt build

EXPOSE 3333
CMD ["yarn", "run", "start"]