# docker-depot

The docker-depot is the tool for develop docker image more easily.

## Motivation

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

By default. The directory by which the .depotrc file was found is recognized as a dockerfiles.

Directory structure

```
dockerfiles
|-- .depotrc
|-- NAME
|   `-- TAG
|       `-- Dockerfile
|-- USERNAME
|   `-- NAME
|       `-- TAG
|           `-- Dockerfile
|-- REGISTRYHOST
|   `-- USERNAME
|       `-- NAME
|           `-- TAG
|               `-- Dockerfile
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

### .depotrc


| Environment         | Description           | Default                                        |
| ------------------- | --------------------- | ---------------------------------------------- |
| DOCKERFILES         | Dockerfiles directory | The directory where the .depotrc file is found |
| DOCKER_BUILD_OPTION | Docker build option   | None                                           |


***lookup path***

docker-depot climbs up the directory tree looking for the first .depotrc it can find,
from the current directory until the before of the home directory.
Then load if exists in the home directory.

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

* \<none\> means that IMAGE has not built.
* \<isolated\> means that the FROM IMAGE has been changed. perhaps need to rebuild.

### docker-depot build

Build your docker image with image name.

```
docker-depot build [OPTION] [IMAGE...] -- [BUILD_OPTION...]
```

### filter parameters

docker-depot list and build have the same filter parameters.

| [OPTION]            | [IMAGE...]        | Description                                         |
| ------------------- | ----------------- | --------------------------------------------------- |
| --from=FROM_IMAGE   |                   | FROM IMAGE is FROM_IMAGE. Glob pattern is available |
| --from-id[=FROM_ID] |                   | FROM ID is begin with FROM_ID. If FROM_ID not specified match all except \<isolated\> and \<none\> |
| --isolated          |                   | FROM ID matches to \<isolated\>                     |
| --none              |                   | FROM ID matches to \<none\>                         |
|                     | bash              | Same as bash:latest                                 |
|                     | bash:4.3 bash:4.4 | Multiple images can be used                         |
|                     | "bash:\*"         | Glob pattern is available                           |
|                     | "\*:\*"           | This matches all images                             |

## Known problems

### Mac OS X

Requires latest (maybe >=1.2) bash-completion for completion works properly.

To install via homebrew

```
brew install bash-completion
```

## Changelog

### 0.2.5

* Release Candidate

### 0.1.0

* Public beta

## License

MIT License

