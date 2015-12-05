# docker-depot

The docker-depot is the tool for develop docker image.

**This is experiment project. Specifications changed significantly or might abolished.**

# How to use

## Prepare your dockerfiles directory

Directory structure

```
$HOME/dockerfiles
|-- IMAGE
|   `-- TAG
|       `-- Dockerfile
`-- bash
    |-- 4.3
    |   `-- Dockerfile
    |-- 4.4
    |   `-- Dockerfile
    `-- latest
        `-- Dockerfile
```

## docker-depot list

Describe your docker image information of the dockerfiles.

```
$ docker-depot list
IMAGE             IMAGE ID      FROM IMAGE     FROM ID       CREATED              PILE SIZE  VIRTUAL SIZE
bash:4.3          c2624043c646  debian:latest  <isolated>    2015-12-05 08:06:51  21.17 MB   146.28 MB
bash:4.4-beta     <none>        debian:latest  <none>        <none>               <none>     <none>
bash:latest       9a237e3ec1d9  debian:latest  23cb15b0fcec  2015-12-05 08:11:02  21.17 MB   146.28 MB
```

* ``<none>`` means that IMAGE has not built.
* ``<isolated>`` means that the FROM IMAGE has been changed. perhaps need to rebuild.


## docker-depot build

Build your docker image with image name.

```
docker-depot build bash:4.4-beta
```

# License

MIT License
