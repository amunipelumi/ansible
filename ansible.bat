@echo off

REM Setting necessary variables
set IMAGE_NAME=amunipelumi/ansible-ee:v1.1
set CONTAINER_NAME=ansible-ee
set WORKDIR=/ansible
set ROOTDIR=/root

REM Checking if container exists
FOR /F "tokens=*" %%i IN ('docker ps -aq -f "name=%CONTAINER_NAME%"') DO (
    set CONTAINER_ID=%%i
)
if defined CONTAINER_ID (
    echo Stopping and removing existing container...
    docker stop %CONTAINER_NAME%
    docker rm %CONTAINER_NAME%
)

REM Running the container interactively
docker run -it --name %CONTAINER_NAME% ^
    -v ansible_volume:%WORKDIR% ^
    -v ansible_root:%ROOTDIR% ^
    %IMAGE_NAME% bash
