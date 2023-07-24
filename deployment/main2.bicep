// Common Parameters
//*****************************************************************************************************
@allowed([ 'set', 'setf', 'jmf', 'jmfe' ])
param bu string = 'jmf'

@allowed([ 'poc', 'dev', 'qa', 'uat', 'prd' ])
param environment string = 'poc'

@maxLength(6)
param role string = 'automa'

@maxLength(2)
param appId string = '02'

@maxLength(6)
param appname string = 'App123'

@description('The Azure region into which the resources should be deployed.')
param location string = resourceGroup().location

@description('The ID of Log Analytics Workspace.')
param workspaceId string ='/subscriptions/ea93148e-4b2f-4f06-b7fb-2c8ecc309d3f/resourceGroups/RG-JMF-POC-2/providers/Microsoft.OperationalInsights/workspaces/workspace-lab-jmf-01'

// Storage Parameters
@description('Globally unique name for the Storage Account')
@minLength(3)
@maxLength(24)
param storageAccountName string = toLower('stg${bu}${environment}${appname}${role}${appId}')
// storage-bu-environment-prodname-appname-role-appId2-corepurpose

@allowed([
  'Standard_LRS'
  'Standard_ZRS'
  'Standard_GRS'
  'Standard_GZRS'
  'Standard_RAGRS'
  'Standard_RAGZRS'
  'Premium_LRS'
  'Premium_ZRS'
])
@description('The Storage Account tier')
param accountTier string = 'Standard_LRS'

@description('The Storage Account tier')
param accessTier string = 'Hot'

// param tags object = {
//  owner: 'JM Family'
//  environment: 'POC'
//  IAC: 'Bicep'
//}

// App Service Parameters
@description('Globally unique name for the App Service')
@maxLength(60)
param appServiceAppName string = toLower('appsvc-${bu}-${environment}-${appname}-${role}-${appId}')
// appsvc-bu-environment-prodname-appname-role-appId2-corepurpose

// @maxLength(60)
// @description('The name of the App Service Plan.')
// param appServicePlanName string = toLower('appsvcplan-${bu}-${environment}-${appname}-${role}-${appId}')

// @description('The name of the App Service plan SKU.')
// param appServicePlanSkuName string = 'B1'

@description('Indicates whether an existing AppServicePlan should be used.')
param useExistingAppServicePlan bool = true

@description('If the above option is = true, the existing App Service Plan ID should be provided.')
param appServicePlanId string = '/subscriptions/ea93148e-4b2f-4f06-b7fb-2c8ecc309d3f/resourceGroups/rg-jmf-poc-2/providers/Microsoft.Web/serverfarms/appsvcplan-jmf-poc-app123-automa-02'

// @description('Indicates whether a Privante endpoint should be created.')
// param useAppPrivateEndpoint bool = true

@description('The ID from Private Endpoint Subnet. If specified then the private endpoint will be created and associated to the Private Endpoint Subnet')
param pvtEndpointSubnetId string = '/subscriptions/ea93148e-4b2f-4f06-b7fb-2c8ecc309d3f/resourceGroups/RG-JMF-POC-2/providers/Microsoft.Network/virtualNetworks/vnet-jmf-poc/subnets/PvtEndpointSubnet'
//*****************************************************************************************************


// App Service
//*****************************************************************************************************
 module appService 'br/ACR-LAB:bicep/patterns/appservice:v1.1.0' = {
  name: 'appServiceModule2'
  params: {
    appServiceAppName: appServiceAppName
    location: location
    workspaceId: workspaceId
    appServicePlanName: appServicePlanName
    appServicePlanSkuName: appServicePlanSkuName
    useExistingAppServicePlan: useExistingAppServicePlan
    appServicePlanId: appServicePlanId
    //useAppPrivateEndpoint: useAppPrivateEndpoint
    pvtEndpointSubnetId: pvtEndpointSubnetId
    // tags: tags
  }
}
//*****************************************************************************************************


// Storage Account
//*****************************************************************************************************
module storageAccountModule 'br/ACR-LAB:bicep/patterns/storage-account:v1.0.0' = {
  name: 'storageAccountModule2'
  params: {
    storageAccountName: storageAccountName
    location: location
    accountTier: accountTier
    accessTier: accessTier
    workspaceId: workspaceId
    // tags: tags
  }
}
//*****************************************************************************************************


// Function App
//*****************************************************************************************************

//*****************************************************************************************************
