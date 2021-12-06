pipeline {
    agent {
        node {
            label 'Linux'
        }
    }
    stages{
        stage('Pruebas') {
            steps {
                sh """
                docker run --privileged -d --network host -v "\$(pwd)":/liquibase/files-$BRANCH_NAME --name liquibase-$BRANCH_NAME-bd -e TZ="America/Bogota" liquibase/liquibase tail -f /dev/null
                docker rm -f liquibase-$BRANCH_NAME-bd
                docker ps
                """
            }
        }
    }
}
