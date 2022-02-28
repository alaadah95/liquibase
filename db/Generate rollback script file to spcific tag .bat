@echo off
title update database
	SETLOCAL
	set scriptPath=%date%-sqlscript.sql
	set username=webuser
	set password=aSecretPass
	set url="jdbc:mysql://localhost:3306/dating"
	set changeLogFile=db-changelog.xml
	set driver="com.mysql.cj.jdbc.Driver"
	 
	set /p mytag="Enter rollback tag : "
	
	call liquibase --driver=%driver% --classpath="mysql-connector-java-8.0.28.jar" --changeLogFile=%changeLogFile% --url=%url% --username=%username% --password=%password%  --outputFile=%scriptPath% rollbackSQL %mytag%
	echo %scriptPath%
	call %scriptPath%
ENDLOCAL
pause
exit
