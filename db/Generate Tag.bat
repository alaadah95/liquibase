@echo off
title update database
SETLOCAL
	set username=webuser
	set password=aSecretPass
	set url="jdbc:mysql://localhost:3306/dating"
	set changeLogFile=db-changelog.xml
	set driver="com.mysql.cj.jdbc.Driver"

	//set date time
	set /p mytag="Enter the tag name : "

	echo /*********************************** Create tag ****************************************/
	call liquibase --driver=%driver% --classpath="mysql-connector-java-8.0.28.jar" --changeLogFile=%changeLogFile% --url=%url% --username=%username% --password=%password% tag %mytag%
	echo tag = %mytag% 
ENDLOCAL
pause
exit
