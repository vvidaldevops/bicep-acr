using './main.bicep'

// Common Parameters
//*****************************************************************************************************
param location = 'eastus'
param bu = 'set'
param stage = 'poc'
param role = 'automa'
param appId = '01'
param appname = 'app123'

param tags = {
  owner: 'JMF'
  environment: 'POC'
  department: 'IT'
  project: 'POC Project'
  IAC: 'Bicep'
}
param workspaceId = '/subscriptions/ea93148e-4b2f-4f06-b7fb-2c8ecc309d3f/resourceGroups/RG-JMF-POC-2/providers/Microsoft.OperationalInsights/workspaces/workspace-lab-jmf-01'
//*****************************************************************************************************

// App Service Plan Parameters
//*****************************************************************************************************
param pvtEndpointSubnetId = ''
param createNewAppServicePlan = true
param existingappServicePlanId = ''
param appServicePlanSkuName = 'S1'
param appServicePlanKind = ''
param appServicePlanTier = 'Standard'
//*****************************************************************************************************

// App Service Parameters
//*****************************************************************************************************
param appServiceEndpointVnetName = 'vnet-jmf-poc'
param appServiceEndpointSubnetName = 'App1Subnet'
//*****************************************************************************************************

// Function App Parameters
//*****************************************************************************************************
param createNewFcnServicePlan = true
param existingFcnServicePlanId = ''
param functionWorkerRuntime = 'node'
param funcStorageAccountTier = 'Standard_LRS'
param funcServiceEndpointVnetName = 'vnet-jmf-poc'
param funcServiceEndpointSubnetName = 'App1Subnet'
param funcStgServiceEndpointvNetName = 'vnet-jmf-poc' 
param funcStgServiceEndpointSubnetName  = 'StorageSubnet'
//*****************************************************************************************************

// Storage Account Parameters
//*****************************************************************************************************
param accountTier = 'Standard_LRS'
param allowBlobPublicAccess = 'Deny'
param stgServiceEndpointVnetName = 'vnet-jmf-poc'
param stgServiceEndpointSubnetName = 'StorageSubnet'
param accessTier = 'Hot'
//*****************************************************************************************************
