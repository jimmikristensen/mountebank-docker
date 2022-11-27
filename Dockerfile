FROM alpine:3.17

ENV MOUNTEBANK_VERSION=2.8.1

RUN apk add --update nodejs-lts && \
    apk add --update npm
RUN npm install -g mountebank@${MOUNTEBANK_VERSION}

EXPOSE 2525
ENTRYPOINT ["mb"]
CMD ["start"]
