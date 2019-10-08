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
		    }
		    if ( "env" == 'test' ) {
			echo "test deploying"
		    }
		    if ( "env" == 'prod' ) {
			echo "prod deploying"
		    }
		    if ( "env" == 'stable' ) {
			echo "stable deploying"
		    }
		}
            }
        }
    }
}
