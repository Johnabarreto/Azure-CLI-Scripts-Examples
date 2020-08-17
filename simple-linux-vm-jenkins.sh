  #!/bin/bash


###################################################################################
# Create resource group and a simple linux new virtual machine and install Jenkins.
###################################################################################

# The parameters vm Name, rg Name, Location, size, user Name, and Password can be modified!

# Parameters

rgname="rg-jenkins"  # Name for the new resource group
location="eastus"    # Location for resource group and VM
vmadmin="******admin"  # Virtual Machine Administrator user
vmapasword="Jenkinspasswordvm"  # Password virtual Machine administrator user
size="Standard_D2_v2" 
vmname="vm-jenkinsqa" # Virtual Machine name

# Parameters scripts
# These parameters are used for Jenkins installation

command1="sudo apt-get update && sudo apt install openjdk-8-jdk -y"
command2="wget -qO - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -"
command3="sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'"
command4="sudo apt-get update"
command5="sudo apt-get install jenkins -y"
command6="sudo service jenkins restart"

echo "======================================================================="
echo "=== Create a new Resource Group ==="
echo "======================================================================="

az group create \
  --name $rgname \
  --location $location

echo "New resource group ready!"

echo "======================================================================="
echo "=== Create Virtual Machine ==="
echo "======================================================================="
az vm create \
  --image UbuntuLTS \
  --admin-username $vmadmin \
  --admin-password $vmapasword \
  --resource-group $rgname \
  --location $location \
  --size $size \
  --name $vmname 
  
echo "New simple Linux VM ready!"

echo "======================================================================="
echo "=== Open port 8080 ==="
echo "======================================================================="

az vm open-port \
--resource-group $rgname \
--name $vmname  \
--port 8080 --priority 1010

echo "Open port!"

echo "======================================================================="
echo "=== Install Jenkins ==="
echo "======================================================================="

az vm run-command invoke \
  -g $rgname \
  -n $vmname \
  --command-id RunShellScript \
  --scripts "${command1} && ${command2} && ${command3} && ${command4} && ${command5} && ${command6}"

echo "Jenkins Install ready!"
