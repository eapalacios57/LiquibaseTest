pipeline {
    agent {
        node {
            label 'Linux'
        }
    stages{
        stage {
            steps {
                script {
                branchEnv = BRANCH_NAME
                sh """
                docker run --privileged -d --network host -v "\$(pwd)":/liquibase/files-${branchEnv} --name liquibase-${branchEnv}-bd -e TZ="America/Bogota" liquibase/liquibase tail -f /dev/null
                docker rm -f liquibase-${branchEnv}-bd
                docker ps
                """
                }
            }
        }
    }
    }
}