FROM alpine:3.20
RUN apk add --no-cache ca-certificates

WORKDIR /app
COPY flow-server /app/flow-server
COPY etat-des-ascenseurs.csv ./etat-des-ascenseurs.csv

EXPOSE 3001
CMD ["/app/flow-server"]
