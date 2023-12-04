# ud-bt-devops-aws
DevOps - AWS, Kubernetes, Docker,  Jenkins, Spring &amp; Java


### SSH into EC2

**Instance ID**
i-018b3b0472491e451 (linux)
Open an SSH client.

Locate your private key file. The key used to launch this instance is awskey.pem

Run this command, if necessary, to ensure your key is not publicly viewable.
```sh
 chmod 400 awskey.pem
```
Connect to your instance using its Public DNS:
```
 ec2-18-218-9-184.us-east-2.compute.amazonaws.com
```
**Example:**
```sh
 ssh -i "awskey.pem" ec2-user@ec2-18-218-9-184.us-east-2.compute.amazonaws.com
```

### Maven 
#### CLI Generate Project
```sh
mvn archetype:generate -DgroupId=com.example -DartifactId=hellomaven -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false

mvn archetype:generate -DgroupId=com.example -DartifactId=java-project -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false


mvn archetype:generate -DgroupId=com.example -DartifactId=java-web-project -DarchetypeArtifactId=maven-archetype-webapp -DinteractiveMode=false

```
#### Run Java Jar from CLI
```sh
java -cp path-to-jar.jar com.example.MainClass
```

