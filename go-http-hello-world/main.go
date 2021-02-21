package main

import (
  "flag"
  "fmt"
  "log"
  "net/http"
  "os"
  "time"
)

var (
  hostname string
  httpAddr string
)

func httpHandler(w http.ResponseWriter, r *http.Request) {
  fmt.Printf("%s - [%s] %s %s %s %s\n", hostname, time.Now().Format(time.RFC3339), r.RemoteAddr, r.Method, r.URL, r.Proto)
  if r.URL.Path != "/" {
    http.NotFound(w, r)
  } else {
    fmt.Fprintf(w, "Hello world! (hostname=%s)", hostname)
  }
}

func main() {
  flag.StringVar(&httpAddr, "http-addr", ":3000", "HTTP listen address")
  flag.Parse()

  var err error
  hostname, err = os.Hostname()
  if err != nil {
    log.Fatalln(err)
  }

  fmt.Println("Listening on", httpAddr)
  http.HandleFunc("/", httpHandler)
  log.Fatalln(http.ListenAndServe(httpAddr, nil))
}
