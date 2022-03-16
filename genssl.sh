openssl genrsa -out rootCA.key 4096
openssl req -x509 -new -nodes -key rootCA.key -days 365 -out rootCA.crt
openssl genrsa -out server.key 4096
openssl req -new -key server.key -out server.csr -config x509.config
openssl x509 -req -in server.csr \
  -CA rootCA.crt \
  -CAkey rootCA.key \
  -CAcreateserial \
  -out server.crt \
  -days 365 \
  -extensions req_ext \
  -extfile x509.config
cat server.key server.crt > server.pem

# cat rootCA.crt > rootCA.pem
# cat rootCA.crt> rootCA.pem
#chown mongod:mongod /etc/ssl/server.pem
#chmod 600 /etc/ssl/server.pem
#chmod 644 /etc/ssl/rootCA.pem
