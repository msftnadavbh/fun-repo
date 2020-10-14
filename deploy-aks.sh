#!/bin/bash

RESOURCEGROUP=rg-aks-neu
LOCATION=northeurope
AKS=aks-neu
VNETname=vnet-aks-neu


az group create -l $LOCATION -n $RESOURCEGROUP

az network vnet create \
--resource-group $RESOURCEGROUP \
--name $VNETname \
--address-prefixes 172.16.0.0/16
