## NGINX study ##

Container assembly:
`$ docker run --name some-nginx -d -p 8080:80 nginx:1.23.3`

Analyze container:
`$ docker exec -it container-id bash`

nginx config:
    1- `cd/etc/nginx/config.d`
    2- `cat default.conf `


## Create APP ##

Command for the creation of the app IMAGE:
`$ docker build -t heroes-app . --no-cache`

Run the app:
`$ docker container run -p 80:80 heroes-app`

