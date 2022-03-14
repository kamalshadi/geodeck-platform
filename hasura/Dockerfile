FROM debian:buster-slim

RUN apt-get update -y && apt-get install -y curl socat
RUN curl -L -o /usr/local/bin/hasura https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh
RUN chmod +x /usr/local/bin/hasura

WORKDIR /usr/src/hasura

COPY . .

RUN chmod +x ./start.sh

CMD "./start.sh"
#COPY ./hasura-metadata /hasura-metadata
#COPY ./hasura-migrations /hasura-migrations
#
#RUN find /hasura-metadata/databases -maxdepth 1 -mindepth 1 -type d | xargs basename | xargs -I {} mkdir -p /hasura-migrations/{}