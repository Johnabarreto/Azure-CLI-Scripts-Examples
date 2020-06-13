#!/bin/bash


###############################################################################
# Create resource group and a simple linux new virtual machine.
###############################################################################

# The parameters vm Name, rg Name, Location, size, user Name, and Password can be modified!

# Parameters

rgname="Type your resource group name"
location="Type your location exam; eastus2 westus2"
vmadmin="Type your vm user admin"
vmapasword="Type your user password"
size="Type your vm size exam; Standard_D4_v3"
vmName="Type your vm Name"

echo "======================================================================="
echo "=== Create a new Resource Group ==="
echo "======================================================================="

az group create 
  --name $rgName 
  --location $location

echo "New resource group ready!"

echo "======================================================================="
echo "=== Create Virtual Machine ==="
echo "======================================================================="
az vm create \
  --image UbuntuLTS \
  --admin-username "vmadmin \
  --admin-password $vmapasword \
  --resource-group $rgname \
  --location $location \
  --size #size \
  --name $vmName

echo "New simple Linux VM ready!"
