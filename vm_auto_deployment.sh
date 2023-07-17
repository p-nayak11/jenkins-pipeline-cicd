#!/bin/bash
az group create --name pnayakAutoRG --location eastus
az vm create --name pnayakAutoVM --resource-group pnayakAutoRG --image Ubuntu2204 --subnet /subscriptions/8528da74-3141-4723-ae71    -8c1841298eb7/resourceGroups/infrastructure/providers/Microsoft.Network/virtualNetworks/default/subnets/default-1 --authentication-type all --admin-username prabhann --admin-password xxxxxx --public-ip-address '' --custom-data cloud-init-jenkins.txt
az vm boot-diagnostics enable --name pnayakAutoVM --resource-group pnayakAutoRG
echo "Please check Jenkins status using the command 'service jenkins status'"
echo "Please copy the Jenkins Auth Token at 'sudo cat /var/lib/jenkins/secrets/initialAdminPassword'"
echo "Follow the rest of the READ.me instructions!"
