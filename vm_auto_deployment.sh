#!/bin/bash
az group create --name BGDeploymentRG --location eastus
az vm create --name pnayakUtilityVM --resource-group BGDeploymentRG --image Ubuntu2204 --subnet xxxxxx  --authentication-type all --admin-username xxxxxx --admin-password xxxxxx --public-ip-address '' --custom-data cloud-init-jenkins.txt
az vm boot-diagnostics enable --name pnayakUtilityVM --resource-group BGDeploymentRG
echo "Please check Jenkins status using the command 'service jenkins status'"
echo "Please copy the Jenkins Auth Token at 'sudo cat /var/lib/jenkins/secrets/initialAdminPassword'"
echo "Follow the rest of the READ.me instructions!"
