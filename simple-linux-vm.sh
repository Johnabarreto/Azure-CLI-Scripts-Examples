#!/bin/bash


###############################################################################
# Create a simple linux new virtual machine.
###############################################################################

# You need to have a resource group for creating a simple Linux VM
# The parameters vm Name, rg Name, Location, size, user Name, and Password can be modified!
echo "======================================================================="
echo "=== Create Virtual Machine ==="
echo "======================================================================="
az vm create \
  --image UbuntuLTS \
  --admin-username vmadmin \
  --admin-password Linux123456789 \
  --resource-group rgdemo \
  --location eastus2 \
  --size Standard_D4_v3 \
  --name vmdemo

echo "New simple Linux VM ready!"
