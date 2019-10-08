pipeline {
    agent any
    parameters {
	string(name: 'env', defaultValue: 'dev', description: 'deploy env')
    }
    stages {
        stage('Build') {
            steps {
                println "Build"
		sh "mkdir ../../jobs/${JOB_NAME}/builds/target"
		sh "cp helloworld.war ../../jobs/${JOB_NAME}/builds/target/"
            }
        }
        stage('Test') {
            steps {
                println "Test"
            }
        }
        stage('Deploy') {
            steps {
		print "Deploy"
		print "${params.env}"
		script {
		    if ( "${params.env}" == "dev" ) {
			echo "dev deploying"
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
