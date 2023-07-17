# Jenkins Pipeline CI/CD 
This repository has all the necessary files for a Jenkins Pipeline that deploys a basic web application using CI/CD and quality checks via SonarQube.

## Set-Up Instructions
1. Run `bash vm_auto_deployment.sh`
    - NOTE: Important informaton is missing from the bash script like the `--subnet` flag and the `--admin-password` flag
    - NOTE: The `--recv-keys` is missing in the cloud-init-jenkins.txt file. Fill it in based on VM.
2. Log into the VM and follow the instructions from the bash script
3. Open a web browser to `http://<privateIP>:8080`. Finish the setup process and install GitHub and SonarQube as plug-ins.
4. Download SonarQube to the VM to run quality checks on the web application. Follow the following tutorials:
    - [Install SonarQube Ubuntu 22.04](https://linux.how2shout.com/how-to-install-sonarqube-on-ubuntu-22-04-lts-server/)
    - [Karen Ngugi's Guide on Installing SonarQube](https://karenngugi.hashnode.dev/installing-sonarqube-on-ubuntu-2204)
    - NOTE: Ensure that the correct user/application and user/passwords are aligned
5. Once connected to SonarQube, create a DockerFile at the location `/var/lib/jenkins/workspace/HelloWorld` and use the script found in dockerfile.txt
6. Create a Github token with the correct access scope for the project. Create a Jenkins credentials with the username and the token.
7. Create a new pipeline project in Jenkins as a GithHub project. Select trigger builds remotely with any arbitrary token. Select pipeline script and use the script in pipeline-script.txt.
    - NOTE: Modify the credentialsId in the Checkout Stage and the SonarQube password in the SonarQube Analysis Stage.
9. **Build Now** on Jenkins to launch the application at `http://<privateIP>:3000`
