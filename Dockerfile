FROM alpine:3.4

ENV MOUNTEBANK_VERSION=1.6.0

RUN apk add --update nodejs-lts
RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production

EXPOSE 2525
ENTRYPOINT ["mb"]
CMD ["start"]
