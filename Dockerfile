# 使用的基础镜像
FROM centos
# 维护者信息
MAINTAINER lanruorufeng@163.com
# 镜像操作命令
RUN mkdir /data
# 指定后续命令的执行目录
WORKDIR /data
# 在/data/下创建jdk目录，用来存放jdk文件
RUN mkdir jdk
# 在/data/下创建tomcat目录，用来存放tomcat
RUN mkdir tomcat
# 将宿主机的对应版本的jdk目录下的文件拷至镜像/data/jdk目录下
ADD /opt/soft/${Jdk} /data/jdk/
# 将宿主机的对应版本的tomcat目录下的文件拷至镜像/data/tomcat目录下
ADD /opt/soft/${Tomcat} /data/tomcat/
# 设置环境变量
ENV JAVA_HOME=/usr/jdk
ENV JRE_HOME=$JAVA_HOME/jre
ENV PATH $PATH:$JAVA_HOME/bin:$CATALINA_HOME/bin
ENV CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib:$CLASSPATH
# 向镜像中增加APP文件
ADD ./build/libs/${ARTIFACT}-${VERSION}-${APPName}.war /data/tomcat/webapps/
# 对外连接端口号
EXPOSE 80
# 容器启动命令
ENTRYPOINT ["/usr/tomcat/bin/catalina.sh","run"]
