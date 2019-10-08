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
			echo "change some compose yml for dev"
			sh './deploy.sh'			
		    }
		    if ( "${params.env}" == 'test' ) {
			echo "test deploying"
			echo "change some compose yml for test"
			sh './deploy.sh'			
		    }
		    if ( "${params.env}" == 'prod' ) {
			echo "prod deploying"
			echo "change some compose yml for prod"
			sh './deploy.sh'			
		    }
		    if ( "${params.env}" == 'stable' ) {
			echo "stable deploying"
			echo "change some compose yml for stable"
			sh './deploy.sh'			
		    }
		}
            }
        }
    }
}
