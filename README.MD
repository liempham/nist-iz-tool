# Introduction
This repo has working container image of the NIST IZ Tool.
- Current tool version: 2.0.10  

Containers:
- MySQL: 5.7.40
- Tomcat: 7.0.109 with JDK 8. JDK 8 is required since the latest IZ version is compiled with JDK 8 dependencies.

The containers utilize persistent data volumes inside "data-volumes" folder
- data-volume/db: for MySQL data
- data-volume/tomcat: for application files and logs

# System requirements
- Docker Desktop with Docker Compose: https://docs.docker.com/compose/install/

# Run the container
```
 #need to remove this file at 1st run to make the folder empty, so that MySQL can initialize data
 rm -f data-volume/db/note.txt

 docker-compose up
```
There are logs for troubleshooting:
- Tomcat logs:  data-volume/tomcat/logs/
- IZ tool logs: data-volume/tomcat/webapps/ROOT/logs/

# Access the tool
- Go to http://localhost:8080 

It might take a couple minutes on 1st load, but will be faster on subsequent runs.

# Update IZ tool
- Go to https://hl7v2-iz-r1.5-testing.nist.gov/iztool/#/doc
- Grab the zip file under: "Validation Tool Downloads"
    - For example: https://hit-2015.nist.gov/wars/iztool-2.0.10.zip
- Extract the zip and overwrite the root war: data-volume/tomcat/webapps/ROOT.war
```
  cd iztool
  wget https://hit-2015.nist.gov/wars/iztool-2.0.10.zip
  unzip iztool-2.0.10.zip
  mv iztool.war ../data-volume/tomcat/webapps/ROOT.war
```
- Start the containers to do db & code update

Note: in case you hit errors when applying IZ tool verion update -> it might help to clean up the old database and IZ files, just to make sure there is no data conflict between the versions.
```
   rm -rf data-volume/db/*
   rm -rf data-volume/tomcat/webapps/ROOT/
```