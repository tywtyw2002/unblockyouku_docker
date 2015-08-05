# unblockyouku_docker
##Usage
###Build docker images
`docker build -t unblock_squid .`

###Start service and bind port
`docker run -d -t -i -p 0.0.0.0:8888:8888 --name unblock_docker unblock_squid`
