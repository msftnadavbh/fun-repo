az group create --name $RESOURCEGROUP --location $LOCATION 

az network vnet create \
--resource-group $RESOURCEGROUP \
--name vnet-aro-nonprod-eastus \
--address-prefixes 10.0.0.0/22

az network vnet subnet create \
--resource-group $RESOURCEGROUP \
--vnet-name vnet-aro-nonprod-eastus \
--name master-subnet \
--address-prefixes 10.0.0.0/23 \
--service-endpoints Microsoft.ContainerRegistry

az network vnet subnet create \
--resource-group $RESOURCEGROUP \
--vnet-name vnet-aro-nonprod-eastus \
--name worker-subnet \
--address-prefixes 10.0.2.0/23 \
--service-endpoints Microsoft.ContainerRegistry

az network vnet subnet update \
--name master-subnet \
--resource-group $RESOURCEGROUP \
--vnet-name vnet-aro-nonprod-eastus \
--disable-private-link-service-network-policies true

az aro create \
  --resource-group $RESOURCEGROUP \
  --name $CLUSTER \
  --vnet vnet-aro-nonprod-eastus \
  --master-subnet master-subnet \
  --worker-subnet worker-subnet \
  --master-vm-size Standard_D8s_v3 \
  --worker-vm-size Standard_D4s_v3 \
  --worker-vm-disk-size-gb 128
  --worker-count 3 \
  --apiserver-visibility Private \
  --ingress-visibility Private \
  --debug
