FROM node:8@sha256:6054aa20c5b7d198524d9bd56c7b2d4fde046b6825e8261ccbf441444a5f4d39

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
