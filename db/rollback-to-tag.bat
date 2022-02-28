@echo off
title update database
	SETLOCAL
	set username=webuser
	set password=aSecretPass
	set url="jdbc:mysql://localhost:3306/dating"
	set changeLogFile=db-changelog.xml
	set driver="com.mysql.cj.jdbc.Driver"

	
	set /p mytag="what is the tag name ?"

	echo /*********************************** Rollback to the tag name ****************************************/
	call liquibase --driver=%driver% --classpath="mysql-connector-java-8.0.28.jar" --changeLogFile=%changeLogFile% --url=%url% --username=%username% --password=%password% rollback %mytag%

	 
ENDLOCAL
pause
exit
