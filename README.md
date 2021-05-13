# staticwebapp
A simple static website running in a Docker container

## Prerequisites
Create an .env file in the project directory and add your custom values to build the image.

Example:

```bash
REPO="5deen/staticwebapp:latest"
IMAGE="web-image"
CONTAINER="web-container-1"
HOST="localhost"
INTERNAL_PORT="80"
EXTERNAL_PORT="8080"

```

## Build and run

```bash

bash ./app.sh

```

