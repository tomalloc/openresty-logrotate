
```bash
docker build -t tomalloc/openresty-logrotate:1.21.4.1-bullseye-fat .
docker push tomalloc/openresty-logrotate:1.21.4.1-bullseye-fat

docker run -d --name openresty  -p 80:80  tomalloc/openresty-logrotate:1.21.4.1


```