using './main.bicep'

param location = 'eastus'
param bu = 'set'
param stage = 'poc'
param role = 'automa'
param appId = '01'
param appname = 'app123'

param tags = {
  owner: 'JM Family'
  environment: 'POC'
  department: 'IT'
  project: 'POC Project'
  IAC: 'Bicep'
}
param workspaceId = '/subscriptions/ea93148e-4b2f-4f06-b7fb-2c8ecc309d3f/resourceGroups/RG-JMF-POC-2/providers/Microsoft.OperationalInsights/workspaces/workspace-lab-jmf-01'

param pvtEndpointSubnetId = ''
param createNewAppServicePlan = true
param existingappServicePlanId = ''
param appServicePlanSkuName = 'B1'
param appServicePlanKind = ''
param appServicePlanTier = ''
param appServiceEndpointSubnetName = 'vnet-jmf-poc'
param createNewFcnServicePlan = true
param existingFcnServicePlanId = ''
param functionWorkerRuntime = 'node'
param funcStorageAccountTier = 'Standard_LRS'
param funcServiceEndpointSubnetName = 'App1Subnet'
param accountTier = 'Standard_LRS'
param allowBlobPublicAccess = false
param stgServiceEndpointSubnetName = 'StorageSubnet'
param accessTier = 'Hot'

