pipeline {
    agent any
    parameters {
	string(name: 'env', defaultValue: 'dev', description: 'deploy env')
    }
    stages {
        stage('Build') {
            steps {
                println "Build"
            }
        }
        stage('Test') {
            steps {
                println "Test"
            }
        }
        stage('Deploy') {
            steps {
		script {
		    if ( "$env" == "dev" ) {
			echo "dev deploying"
		    }elif ( "env" == 'test' ) {
			echo "test deploying"
		    }elif ( "env" == 'prod' ) {
			echo "prod deploying"
		    }elif ( "env" == 'stable' ) {
			echo "stable deploying"
		    }
		}
            }
        }
    }
}
