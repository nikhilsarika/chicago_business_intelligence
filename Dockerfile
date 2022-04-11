# syntax=docker/dockerfile:1

ENV PORT 80
ENV HOSTDIR 0.0.0.0

EXPOSE 80
FROM golang:1.17-alpine
WORKDIR /app
COPY go.mod ./
COPY go.sum ./
RUN go mod tidy
COPY . ./
RUN go build -o /main
CMD [ "/main" ]