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
                docker exec liquibase-$BRANCH_NAME-bd bash -c 'cd files-$BRANCH_NAME && \
                liquibase --defaultsFile=installerNoCode.properties --username=APP_BIRC_DEV --password=${password} --url=jdbc:oracle:thin:@//190.85.106.202:1523/ORCLCDB.localdomain update'
                docker rm -f liquibase-$BRANCH_NAME-bd
                docker ps
                """
            }
        }
    }
}
