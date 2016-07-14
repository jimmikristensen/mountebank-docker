FROM alpine:3.4

ENV MOUNTEBANK_VERSION=1.5.1

RUN apk add --update nodejs
RUN npm install -g mountebank@${MOUNTEBANK_VERSION} --production

EXPOSE 2525
ENTRYPOINT ["mb"]
CMD ["start"]