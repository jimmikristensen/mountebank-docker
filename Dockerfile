FROM alpine:3.14

ENV MOUNTEBANK_VERSION=2.4.0

RUN apk add --update nodejs-lts && \
    apk add --update npm
RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production

EXPOSE 2525
ENTRYPOINT ["mb"]
CMD ["start"]
