#!/bin/bash

RESOURCEGROUP=rg-aks-neu
LOCATION=northeurope
AKS=aks-neu


az group create -l $LOCATION -n $RESOURCEGROUP

az network
