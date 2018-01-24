FROM node:8-alpine@sha256:b1e1f024dccf7058d2f55b21d6bf65c9cb932ba7bee2a24eca08ddb7c654312b

LABEL maintainer "Michael Brunton-Spall <michael@brunton-spall.co.uk>"
LABEL uk.co.brunton-spall.version "0.0.1-beta"

ARG BOTKIT_STORAGE_POSTGRES_HOST=localhost
ENV token=xoxb-token \
    apitoken=xoxp-apitoken \
    slackdomain=mbs-bot-test.slack.com

COPY . /usr/src/xgovslackbot

WORKDIR /usr/src/xgovslackbot

RUN npm install --dev \
    && BOTKIT_STORAGE_POSTGRES_HOST=${BOTKIT_STORAGE_POSTGRES_HOST} npm test .
