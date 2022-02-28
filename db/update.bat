@echo off
title update database
	SETLOCAL
	set username=webuser
	set password=aSecretPass
	set url="jdbc:mysql://localhost:3306/dating"
	set changeLogFile=db-changelog.xml
	set driver="com.mysql.cj.jdbc.Driver"
	set mytag=tag-%date%-%time%

	echo /*********************************** Create tag ****************************************/
	call liquibase --driver=%driver% --classpath="mysql-connector-java-8.0.28.jar" --changeLogFile=%changeLogFile% --url=%url% --username=%username% --password=%password% tag %mytag%

	echo /*********************************** Update database ************************************/
	call liquibase --driver=%driver% --classpath="mysql-connector-java-8.0.28.jar" --changeLogFile=%changeLogFile% --url=%url% --username=%username% --password=%password%  update
	echo tag = %mytag% 
ENDLOCAL
pause
exit
