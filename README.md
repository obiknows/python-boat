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

3. Run it on VMs or hosting services as a service and deploy it to a swarm

``` 
// get ya vms up (install virtualbox first pls.)
$ docker-machine create --driver virtualbox myvm1
$ docker-machine create --driver virtualbox myvm2

// create the swarm manager
$ docker-machine ssh myvm1 "docker swarm init"

// add in a worker (copy whats in quote from the output of the last command)
$ docker-machine ssh myvm2 "docker swarm join \
--token <token> \
<ip>:<port>"

// copy the docker-compose file
$ docker-machine scp docker-compose.yml myvm1:~

// deploy the service to the swarm
$ docker-machine ssh myvm1 "docker stack deploy -c docker-compose.yml getstartedlab"

// ... and to take the service down
$ docker-machine ssh myvm1 "docker stack rm getstartedlab"

// to remove the swarm
$ docker-machine ssh myvm2 "docker swarm leave"
$ docker-machine ssh myvm1 "docker swarm leave --force"
```