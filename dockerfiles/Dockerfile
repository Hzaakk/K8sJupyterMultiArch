FROM node:current-alpine3.12
EXPOSE 80

ARG TARGETPLATFORM

RUN apk add --no-cache curl && \
    curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/$(echo ${TARGETPLATFORM} | sed 's/arm64/arm/')/kubectl && \
    chmod +x ./kubectl && \
    mv ./kubectl /usr/local/bin/kubectl

COPY ../appimage/ /app/
WORKDIR /app/

CMD npm start
