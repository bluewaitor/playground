#!/usr/bin/env bash

DIR_NAME=$1
FILE_NAME=$2

if [ $# -lt 2 ] ; then
    echo Usage: $0 [目录名] [文件名]
    exit 1
fi

CLEAN_FILE=./clean.sh
CONTAINER_NAME=$DIR_NAME

echo '清理文件'

if test -x $CLEAN_FILE; then
    bash $CLEAN_FILE $DIR_NAME $FILE_NAME
    echo '清理结束'
else
    echo 'clean.sh 没有权限'
    exit 2
fi

docker inspect $CONTAINER_NAME -f '{{.Name}}' > /dev/null 2>&1

if [ $? -eq 0 ]; then
    echo '容器存在，删除它'
    docker rm $CONTAINER_NAME > /dev/null
else
    echo '容器不存在'
fi

echo ${@:3}

docker run --name $CONTAINER_NAME -d -v `pwd`:/home bluewaitor/nasm \
 --entrypoint docker.sh $DIR_NAME $FILE_NAME ${@:3} > /dev/null

echo '执行结果: '

docker logs $CONTAINER_NAME
