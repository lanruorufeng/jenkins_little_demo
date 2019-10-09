pipeline {
    agent any
    parameters {
	string(name: 'env', defaultValue: 'dev', description: 'deploy env')
	string(name: 'type', defaultValue: 'app', description: 'deploy type')
    }
    stages {
        stage('Build') {
            steps {
                println "Building"
		script {
		    sh "mkdir ../../jobs/${JOB_NAME}/builds/target"    
		    if ( "${params.type}" == "app" ) {
			sh "cp ./helloworld.war ../../jobs/${JOB_NAME}/builds/target/"
            	    }
		    if ( "${params.type}" == "web" ) {
		        sh "mkdir webfile"
			sh "unzip -d ./webfile ./web.zip"
			sh "cp ./webfile/* ../../jobs/${JOB_NAME}/builds/target/"
		    }
		}
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
			sh "./deploy.sh ${params.type}"			
		    }
		    if ( "${params.env}" == 'test' ) {
			echo "test deploying"
			echo "change some compose yml for test"
			sh "./deploy.sh ${params.type}"			
		    }
		    if ( "${params.env}" == 'prod' ) {
			echo "prod deploying"
			echo "change some compose yml for prod"
			sh "./deploy.sh ${params.type}"			
		    }
		    if ( "${params.env}" == 'stable' ) {
			echo "stable deploying"
			echo "change some compose yml for stable"
			sh "./deploy.sh ${params.type}"			
		    }
		}
            }
        }
    }
}
