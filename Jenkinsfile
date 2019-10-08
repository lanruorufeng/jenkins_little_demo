pipeline {
    agent any
    parameters {
	string(name: 'env', defaultValue: 'dev', description: 'deploy env')
    }
    stages {
        stage('Build') {
            steps {
                println "Building"
		sh "mkdir ../../jobs/${JOB_NAME}/builds/target"
		sh "cp ./helloworld.war ../../jobs/${JOB_NAME}/builds/target/"
            }
        }
        stage('Test') {
            steps {
                println "Testing"
            }
        }
        stage('Deploy') {
            steps {
		print "Deploying"
		print "${params.env}"
		script {
		    if ( "${params.env}" == "dev" ) {
			echo "dev deploying"
			CONTAINER="jenkins_little_demo"
			IMAGE=$CONTAINER":"$(date -d "today" +"%Y%m%d_%H%M%S")
			docker rm `docker ps -a | grep -w $CONTAINER"_"$CONTAINER | awk '{print $1}'`
			docker rmi --force `docker images | grep -w $CONTAINER | awk '{print $3}'`
			docker build -t $IMAGE . && \
			rm -rf docker-compose.jenkins.yml && \
			cp docker-compose.src.yml docker-compose.jenkins.yml && \
			sed -i s%IMAGE_LATEST%$IMAGE%g docker-compose.jenkins.yml && \
			docker stack deploy -c docker-compose.jenkins.yml $CONTAINER
			
		    }
		    if ( "${params.env}" == 'test' ) {
			echo "test deploying"
		    }
		    if ( "${params.env}" == 'prod' ) {
			echo "prod deploying"
		    }
		    if ( "${params.env}" == 'stable' ) {
			echo "stable deploying"
		    }
		}
            }
        }
    }
}
