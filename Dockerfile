FROM golang:alpine

EXPOSE 8000

COPY app.go .
COPY blockchain.html /

RUN apk add --no-cache git mercurial \
    && go get -d -v \
         github.com/lib/pq \
           github.com/julienschmidt/httprouter \
    && apk del git mercurial

RUN go build -o a.out

CMD ./a.out
