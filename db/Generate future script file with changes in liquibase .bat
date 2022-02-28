@echo off
title update database
	SETLOCAL
	set scriptPath=%date%-sqlscript.txt
	set rollbackScriptPath=%date%-rollback-sqlscript.txt
	set username=webuser
	set password=aSecretPass
	set url="jdbc:mysql://localhost:3306/dating"
	set changeLogFile=db-changelog.xml
	set driver="com.mysql.cj.jdbc.Driver"
	echo /***********************************************(Generate Script)**********************************************************/
	call liquibase --driver=%driver% --classpath="mysql-connector-java-8.0.28.jar" --changeLogFile=%changeLogFile% --url=%url% --username=%username% --password=%password%  --outputFile=%scriptPath% updateSQL
	
	echo /***********************************************(Generate Rollback Script)**********************************************************/
	call liquibase --driver=%driver% --classpath="mysql-connector-java-8.0.28.jar" --changeLogFile=%changeLogFile% --url=%url% --username=%username% --password=%password%  --outputFile=%rollbackScriptPath% futureRollbackSQL
	call %scriptPath%
	call %rollbackScriptPath%
ENDLOCAL
pause
exit
