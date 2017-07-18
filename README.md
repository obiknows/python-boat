(boat) python-app
=================

so a boat is a docker app.

we can run it 2 ways

1. Straight on the `docker-machine`

```
// build and run it in docker

$ IMAGE=<call this whatever you want> && \
  docker build -t $IMAGE . && \
  docker run -p 4000:80 $image

// ...then go to localhost:4000 and check it out
```

2. Run it as a service and deploy it to a swarm

``` 
// get a swarm running
$ docker swarm init

// run deploy a stack of apps
$ STACK=<whatever you want>
$ docker stack deploy -c docker-compose.yml $STACK

// ...then test that stack (do this a couple times)
$ http localhost

// tear it down the stack and the swarm
$ docker stack rm $STACK
$ docker swarm leave --force
```

