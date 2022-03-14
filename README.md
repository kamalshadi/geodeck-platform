# geodeck-platform
All Geodeck services started from a single repository

*Keep in mind this repository is for local development only and is not meant to be deployed on any production environment!

## Requirements
1. [Docker](https://docs.docker.com/install/)
2. [Docker Compose](https://docs.docker.com/compose/install/)


## How to run it?

1. Go to the cloned directory:
```
$ cd geodeck-platform
```

2. Build the application:
```
$ docker-compose build
```

3. Run the application:
```
$ docker-compose up
```

## How to update the subprojects to the newest versions?
This repository contains newest stable versions.
When new release appear, pull new version of this repository.
In order to update all of them to their newest versions, run:
```
$ git submodule update --remote
```

You can find the latest version of Geodeck services in their individual repositories:

- https://github.com/kamalshadi/geodeck-app-backend
- https://github.com/kamalshadi/geodeck-app-frontend
- https://github.com/kamalshadi/geodeck-microservices

## How to solve issues with lack of available space or build errors after update

Most of the time both issues can be solved by cleaning up space taken by old containers. After that, we build again whole platform. 


1. Make sure docker stack is not running
```
$ docker-compose stop
```

2. Remove existing volumes

**Warning!** Proceeding will remove also your database container! If you need existing data, please remove only services which cause problems! https://docs.docker.com/compose/reference/rm/
```
docker-compose rm
```

3. Build fresh containers 
```
docker-compose build
```

4. Now you can run fresh environment using commands from `How to run it?` section. Done!

### Still no available space

If you are getting issues with lack of available space, consider prunning your docker cache:

**Warning!** This will remove:
  - all stopped containers
  - all networks not used by at least one container
  - all dangling images
  - all dangling build cache 
  
  More info: https://docs.docker.com/engine/reference/commandline/system_prune/
  
<details><summary>I've been warned</summary>
<p>

```
$ docker system prune
```

</p>
</details>

## How to run application parts?
  - `docker-compose up api` for backend services only
  - `docker-compose up` for backend and frontend services


## Where is the application running?
- GeoDeck backend (API) - http://localhost:8000
- GeoDeck frontend - http://localhost:3000
- Hasura console - http://localhost:9695
- Minio (S3) - http://localhost:9000
- PgAdmin - http://localhost:5050