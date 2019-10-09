# 使用的基础镜像
FROM nginx
# 维护者信息
MAINTAINER lanruorufeng@163.com
# 向镜像中增加文件
#ADD ./build/libs/* /user/share/nginx
ADD ./static/* /user/share/nginx
# 对外连接端口号
EXPOSE 80
# 容器启动命令
CMD nginx
