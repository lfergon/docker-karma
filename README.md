# Build the Docker image

```shell
docker build -t {username}/karma-chrome:latest .
```

# Login to Docker (if you haven't already)

```shell
docker login
```

# Push the Docker 

```shell
docker push {username}/karma-chrome:latest
```

If developing on a Mac but want to build a Docker image targeted for a Linux platform

Docker `buildx` enables building for multiple platforms, including building ARM images on an x86 host and vice versa.


1. **Enable Experimental CLI Features**:

To use `buildx`, you need to have experimental features enabled. You can do this by setting the `DOCKER_CLI_EXPERIMENTAL` environment variable to `enabled`.

```shell
export DOCKER_CLI_EXPERIMENTAL=enabled
```

2. **Install `buildx`**:

If you haven't already, you can install `buildx` using:

```shell
docker buildx create --name mybuilder --use
```

3. **Build for Specific Platforms**:

Using `buildx`, specify a target platform with `--platform` flag. For a Linux host, use `linux/amd64`.

```shell
docker buildx build --platform linux/amd64 -t {username}/karma-node-chrome:latest .
```

This command builds your image for the `linux/amd64` platform. You can also push directly to Docker Hub by appending `--push`:

```shell
docker buildx build --platform linux/amd64 -t {username}/karma-node-chrome:latest . --push
```
