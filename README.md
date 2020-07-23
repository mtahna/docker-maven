# docker-maven

# Create Docker Image
Do the following when creating an docker image.
```
% make build
```
Can be executed by specifying the Maven version.
For example, execute it for the Maven=3.6.2 version. 
```
% make build mvn_ver=3.6.2 jdk_ver=jdk8
```

# Execute Maven Build
Do the following when executing Maven build.
```
% make run -src [Target Source] -cmd [Target Command]
```

Can be executed by specifying the Maven version.
For example, execute it for the "Project" folder. 
```
% make run -src Project -cmd "mvn package" -mvn_ver=3.6.2 jdk_ver=jdk8
```
