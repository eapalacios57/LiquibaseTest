# birc-core-basedatos-liquibase  prueba fork

# Tables of the liquibase:
    SELECT * FROM DATABASECHANGELOG;
    SELECT * FROM DATABASECHANGELOGLOCK ;

# Reverse:
    rollbackToDate:
        liquibase --defaultsFile=installerNoCode.properties --changeLogFile=Model/installerNoCode.xml rollbackToDate 2021-06-07
        liquibase --defaultsFile=installerWithCode.properties --changeLogFile=Model/installerWithCode.xml rollbackToDate 2021-06-07

    rollbackCount:
        liquibase --defaultsFile=installerNoCode.properties --changeLogFile=Model/installerNoCode.xml rollbackCount 2
        liquibase --defaultsFile=installerWithCode.properties --changeLogFile=Model/installerWithCode.xml rollbackCount 2
    
    updateTestingRollback:(PENDIENTE)
        liquibase --defaultsFile=installerNoCode.properties --changeLogFile=Model/installerNoCode.xml updateTestingRollback

    rollback:(el mejor)
        liquibase --defaultsFile=installerNoCode.properties --changeLogFile=Model/installerNoCode.xml rollback $(before last tag)
        liquibase --defaultsFile=installerNoCode.properties --changeLogFile=Model/installerWithCode.xml rollback  $(before last tag)
    
    More: https://docs.liquibase.com/commands/home.html

# ¿How install liquibase in jenkins?:
    docker run --privileged -d --network host -v $(pwd):/liquibase/$(basename "$PWD") --name liquibase liquibase/liquibase tail -f /dev/null && docker ps
    docker exec -it liquibase bash -c "cd /liquibase/$(basename "$PWD") && liquibase update"

# Syntaxys para tablas:
    <include file="Tablas/DDL/v0.1.0_CREATE_TABLE_PERSON.sql" relativeToChangelogFile="true"/>

# Syntaxys para tablas PACKAGES:    
    <changeSet author="liquibase-docs" id="1" runOnChange="true">
     <sqlFile dbms="!h2, oracle, mysql"
        encoding="UTF-8"
        endDelimiter="//"
        path="Packages/OPERACIONES_BASICAS.pkg"
        relativeToChangelogFile="true"
        splitStatements="true"
        stripComments="true"/>
    </changeSet>

    <changeSet author="liquibase-docs" id="2" runOnChange="true">
     <sqlFile dbms="!h2, oracle, mysql"
        encoding="UTF-8"
        endDelimiter="//"
        path="Packages/OPERACIONES_BASICAS.pkb"
        relativeToChangelogFile="true"
        splitStatements="true"
        stripComments="true"/>
    </changeSet>
# Files:
    1. installerNoCode.xml
        Contiene todo lo que NO es PROCEDURE(.prc), PACKAGE(.pkg), TRIGGER(.trg), FUNCTION(.fnc)
    2. installerWithCode.xml
        Contiene TODO lo que es PROCEDURE(.prc), PACKAGE(.pkg), TRIGGER(.trg), FUNCTION(.fnc)
    Opciones: 
        => va solo installerNoCode.xml.
            * liquibase --defaultsFile=installerNoCode.properties --changeLogFile=Model/installerNoCode.xml update
            * liquibase --defaultsFile=installerNoCode.properties --changeLogFile=Model/installerNoCode.xml rollbackToDate 2021-06-07
            * SELECT * FROM DATABASECHANGELOG ORDER BY 5 desc; --installerNoCode.xml
        => va solo installerWithCode.xml.
            * liquibase --defaultsFile=installerWithCode.properties --changeLogFile=Model/installerWithCode.xml update
            * --NO SE COMO HACER ROLLBACK
                Uno: Con github como en mucura.
            * SELECT * FROM STOREDPROCCHANGELOG ORDER BY orderexecuted DESC; --installerWithCode.xml
        => va installerNoCode.xml y va installerWithCode.xml.

        liquibase --defaultsFile=installerNoCode.properties --changeLogFile=Model/installerNoCode.xml tag v0.0.0 //${tag}
# Notes:
    1. Las tablas siempre deben ir al final ya que el rollback se hace de abajo hacia arriba y se puede hacer con liquibase rollbackCount x(Valor entero que indica el número n de registros de la tabla), mejor opción hacerlo con tags;(No aplica al tener separados los archivos).

    2. En este repo deben quedar solo la carpeta Model
