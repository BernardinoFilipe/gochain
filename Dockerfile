FROM golang:1.14-alpine

WORKDIR /go/src/app
COPY app.go .

RUN apk add --no-cache git mercurial \
    && go get -d -v \
        github.com/lib/pq \
        github.com/julienschmidt/httprouter \
    && apk del git mercurial

RUN go build -o a.out

CMD [./a.out]
