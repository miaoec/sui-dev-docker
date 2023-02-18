# sui-dev-docker
dockerfile for sui env
## BUILD

```
git clone https://github.com/miaoec/sui-dev-docker.git
cd sui-dev-docker
docker build -f Dockerfile -t sui-dev:latest . 
```

## START

```
docker run  -dit  -p 56000:22  --privileged sui-dev:latest  
```
