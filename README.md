# Jenkins Pipeline CI/CD 
This repository has all the necessary files for a Jenkins Pipeline that deploys a basic web application using CI/CD and quality checks via SonarQube.

## Set-Up Instructions
1. Run `bash vm_auto_deployment.sh`
    - NOTE: Important informaton is missing from the bash script like the `--subnet` flag and the `--admin-password` flag
    - NOTE: The `--recv-keys` is missing in the cloud-init-jenkins.txt file. Fill it in based on VM.
2. Log into the VM and follow the instructions from the bash script
3. Open a web browser to `http://<privateIP>:8080`. Finish the setup process and install GitHub as the initial plug-in. Later install SonarQube and Blue Ocean plug-ins.
4. Download SonarQube to the VM to run quality checks on the web application. Follow the following tutorials:
    - [Install SonarQube Ubuntu 22.04](https://linux.how2shout.com/how-to-install-sonarqube-on-ubuntu-22-04-lts-server/)
    - [Karen Ngugi's Guide on Installing SonarQube](https://karenngugi.hashnode.dev/installing-sonarqube-on-ubuntu-2204)
    - NOTE: Ensure that the correct user/application and user/passwords are aligned
    - NOTE: Let sonar.web.port = 0.0.0.0 in `/opt/sonarqube/conf/sonar.properties`
5. Once connected to SonarQube, setup a project Manually named **WebApp**.
7. Create a Github token with the correct access scope for the project. Create a Jenkins credentials with the username and the token.
8. Configure the SonarQube plug-in in Jenkins by creating a SonarQube Scanner named sonarqube installed from Maven Central
9. Create a new pipeline project in Jenkins as a GithHub project. Select trigger builds remotely with any arbitrary token. Select pipeline script and use the script in pipeline-script.txt.
    - NOTE: Modify the credentialsId in the Checkout Stage and the SonarQube password in the SonarQube Analysis Stage.
10. **Build Now** on Jenkins to create the build directories in the VM.
    - NOTE: Authenicate the utility VM by following the url provided in the Azure Login Stage logs. This is only required the first time. 
11. After a few minutes, check to ensure all the stages have compiled. Check the message at `http://<privateIP>:3000` for each individual VM and for the load balancer's front end. 

## Resources
[Microsoft Learn Jenkins Pipeline](https://learn.microsoft.com/en-us/azure/developer/jenkins/pipeline-with-github-and-docker)
