#!/bin/bash

# 容器名称
CONTAINER="jenkins_littl_demo"
# 镜像名称（以日期时间为镜像标签，防止重复）
IMAGE=$CONTAINER":"$(date -d "today" +"%Y%m%d_%H%M%S")

# 删除滚动更新残留的容器
docker rm `docker ps -a | grep -w $CONTAINER"_"$CONTAINER | awk '{print $1}'`
# 强制删除滚动更新残留的镜像
docker rmi --force `docker images | grep -w $CONTAINER | awk '{print $3}'`

# 创建新镜像
if [ "$1" = 'app' ];then
	docker build -t $IMAGE ./appDockerfile/ && \
else 
	docker build -t $IMAGE ./webDockerfile/ && \
	

# 删除 docker-compose.yml 文件，防止使用相同镜像
rm -rf docker-compose.yml && \

# 复制 docker-compose.src.yml 文件，防止污染原文件
cp docker-compose.src.yml docker-compose.yml && \

# 替换镜像名标志位为最新镜像
sed -i s%IMAGE_LATEST%$IMAGE%g docker-compose.yml && \

# 使用 docker stack 启动服务
docker stack deploy -c docker-compose.yml $CONTAINER
