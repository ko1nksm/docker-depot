# docker-depot

The docker-depot is the tool for develop docker image.

**This is experiment project. Specifications changed significantly or might abolished.**

## Motivation

What created for?
* To develop the image of docker more easily.

Replacement of the docker command?
* No. just a support tool.

Why don't you use docker image?
  * It displays the images I don't care as docker image developer.
  * I want to know it has been created from what image.
  * I want to know the need for (re)building image.

Why don't you use docker build?
  * I want to build by image name with tag.
  * I want to build to related images at once.

Why don't you use docker-compose?
  * Compose is a tool for multi-container Docker applications
  * docker-depot is a tool for single (or related) image building.

Why don't you use docker hub?
  * Automated Build and Repository Links feature is served part of my purpose.
  * But I want to use locally sometimes.

## How to use

### Prepare your dockerfiles directory

Directory structure

```
$HOME/dockerfiles
|-- NAME
|   `-- TAG
|       `-- Dockerfile
|-- USERNAME
|   `-- NAME
|       `-- TAG
|           `-- Dockerfile
|-- bash
|   |-- 4.3
|   |   `-- Dockerfile
|   |-- 4.4
|   |   `-- Dockerfile
|   `-- latest
|       `-- Dockerfile
`-- ko1nksm
    `-- ddns
        `-- latest
            `-- Dockerfile
```

### .docker-depotrc

| Environment      | Description           |
| ---------------- | --------------------- |
| DOCKERFILES      | Dockerfiles directory |
| DOCKER_BUILD_OPT | Docker build option   |


### docker-depot list

Describe your docker image information of the dockerfiles.

```
docker-depot list [OPTION] [IMAGE...]
```

```
$ docker-depot list
IMAGE                IMAGE ID      FROM IMAGE     FROM ID       CREATED              PILE SIZE  VIRTUAL SIZE
bash:4.3             c2624043c646  debian:latest  <isolated>    2015-12-05 08:06:51  146.28 MB  146.28 MB
bash:4.4-beta        <none>        debian:latest  <none>        <none>               <none>     <none>
bash:latest          9a237e3ec1d9  debian:latest  23cb15b0fcec  2015-12-05 08:11:02  21.17 MB   146.28 MB
ko1nksm/ddns:latest  641bd19cb5b8  debian:latest  <isolated>    2015-12-05 05:48:15  220.03 MB  220.03 MB
```

* ``<none>`` means that IMAGE has not built.
* ``<isolated>`` means that the FROM IMAGE has been changed. perhaps need to rebuild.

example

| Command                                | Description                                         |
| -------------------------------------- | --------------------------------------------------- |
| docker-depot list                      | list all                                            |
| docker-depot list bash                 | list bash:latest                                    |
| docker-depot list bash:4.3 bash:4.4    | list bash:4.3 and bash:4.4                          |
| docker-depot list "bash:\*"            | list in bash:\*                                     |
| docker-depot list "\*:\*"              | list all                                            |
| docker-depot list --isolated "bash:\*" | list the ones that were isolated in bash:\*         |
| docker-depot list --isolated --none    | list the ones that were isolated or none in bash:\* |
| docker-depot list --from=debian        | list the ones that FROM IMAGE is debian:latest      |

### docker-depot build

Build your docker image with image name.

```
docker-depot build [OPTION] [IMAGE...] -- [BUILD_OPTION...]
```

example

| Command                                 | Description                                          |
| --------------------------------------- | ---------------------------------------------------- |
| docker-depot build                      | build without arguments is not supported             |
| docker-depot build bash                 | build bash:latest                                    |
| docker-depot build bash:4.3 bash:4.4    | build bash:4.3 and bash:4.4                          |
| docker-depot build "bash:\*"            | build in bash:\*                                     |
| docker-depot build "\*:\*"              | build all                                            |
| docker-depot build --isolated "bash:\*" | build the ones that were isolated in bash:\*         |
| docker-depot build --isolated --none    | build the ones that were isolated or none in bash:\* |
| docker-depot build --from=debian        | build the ones that FROM IMAGE is debian:latest      |

## License

MIT License

