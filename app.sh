#!/bin/sh
# Run docker commands
# Note: Execute it with bash ./app.sh

# 1. Set variables
source .env

# 2. Build image
build_image()
{
  docker build -t $IMAGE .
}

# 3. Run container with local Dockerfile
local_run()
{
  docker run --name $CONTAINER -d -p $EXTERNAL_PORT:$INTERNAL_PORT $IMAGE
}

# 4. Run container with image from repo
repo_run()
{
  docker run --name $CONTAINER -d -p $EXTERNAL_PORT:$INTERNAL_PORT $REPO
}

# 5. Stop container
stop()
{
  docker stop $CONTAINER
}

# 6. Start container
start()
{
  docker start $CONTAINER
}

# 7. Remove container
rm()
{
  docker rm $CONTAINER
}

# 7. Remove local image
rmi()
{
  docker rmi $IMAGE
}

# 8. Run container with local Dockerfile and bash into it
bash_run()
{ 
  docker run -it --rm $IMAGE bash
}


# Get parameters and run functions

# Default message if no arguments
if [ "$1" == "" ]; then
    echo "Run script with parameters: build_image, local_run, repo_run, stop, start, rm, rmi, bash_run"
fi

# 1. Build image
if [ "$1" == "build_image" ]; then
    build_image
fi

# 2. Run new container
if [ "$1" == "local_run" ]; then
    local_run
    echo "http://$HOST:$EXTERNAL_PORT"
fi

# 3. Show repo endpoint
if [ "$1" == "repo_run" ]; then
    repo_run
    echo "http://$HOST:$EXTERNAL_PORT"
fi

# 4. Stop container
if [ "$1" == "stop" ]; then  
    stop
fi

# 5. Start container
if [ "$1" == "start" ]; then
    start
fi

# 6. Remove container
if [ "$1" == "rm" ]; then
    rm
fi

# 7. Remove local image
if [ "$1" == "rmi" ]; then
    rmi
fi

# 8. Run container with bash
if [ "$1" == "bash_run" ]; then
    bash_run
fi
