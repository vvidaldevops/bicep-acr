// Common Parameters
//*****************************************************************************************************
@description('The Azure region into which the resources should be deployed.')
@allowed([
  'eastus'
])
param location string = 'eastus'

@allowed([ 'set', 'setf', 'jmf', 'jmfe' ])
param bu string = 'jmf'

@allowed([ 'poc', 'dev', 'qa', 'uat', 'prd' ])
param stage string = 'poc'

@maxLength(6)
param role string = 'automa'

@maxLength(2)
param appId string = '01'

@maxLength(6)
param appname string = 'app123'

param tags object = {
  owner: 'JM Family'
  environment: 'POC'
  department: 'IT'
  project: 'POC Project'
  IAC: 'Bicep'
}

@description('The ID of Log Analytics Workspace.')
param workspaceId string ='/subscriptions/ea93148e-4b2f-4f06-b7fb-2c8ecc309d3f/resourceGroups/RG-JMF-POC-2/providers/Microsoft.OperationalInsights/workspaces/workspace-lab-jmf-01'

@description('The ID from Private Endpoint Subnet. If specified then the private endpoint will be created and associated to the Private Endpoint Subnet')
param pvtEndpointSubnetId string = ''
//*****************************************************************************************************

// App Service Plan Parameters
//*****************************************************************************************************
// @maxLength(60)
// @description('The name of the App Service Plan.')
// param appServicePlanName string = toLower('appsvcplan-${bu}-${environment}-${appname}-${role}-${appId}')

@description('The name of the App Service plan SKU.')
param appServicePlanSkuName string = 'B1'

@description('Indicates whether AppServicePlan should be created or using an existing one.')
param createNewAppServicePlan bool = true

@description('If the above option is = true, the existing App Service Plan ID should be provided.')
param appServicePlanId string = ''

//*****************************************************************************************************

// App Service Parameters
//*****************************************************************************************************
// @description('Globally unique name for the App Service')
// @maxLength(60)
// param appServiceAppName string = toLower('appsvc-${bu}-${environment}-${appname}-${role}-${appId}')
// appsvc-bu-environment-prodname-appname-role-appId2-corepurpose
//*****************************************************************************************************

// Function App Parameters
//*****************************************************************************************************
// @description('The name of the function app that you wish to create.')
// param functionAppName string = toLower('fnapp-${bu}-${environment}-${appname}-${role}-${appId}')
// param funcAppServicePlanName string = toLower('func-appsvc-${bu}-${environment}-${appname}-${role}-${appId}')
// param funcStorageAccountName string = 'stgfunctionlab'

@description('The language worker runtime to load in the function app.')
@allowed([
  'node'
  'dotnet'
  'java'
])
param functionWorkerRuntime string = 'dotnet'

@description('The Storage Account tier')
param funcStorageAccountTier string = 'Standard_LRS'

@description('The Storage Account tier')
param funcStorageAccessTier string = 'Hot'
//*****************************************************************************************************

/*
// Storage Parameters
//*****************************************************************************************************
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
*/
//*****************************************************************************************************

/*
// App Service
//*****************************************************************************************************
module appService 'br/ACR-LAB:bicep/patterns/appservice:v1.0.0' = {
 // module appService '../../../01-COMPONENTS-and-PATTERNS/bicep-modules/modules/patterns/appservice/simple-appservice.bicep' = {
  name: 'appServiceModule2'
  params: {
    bu: bu
    stage: stage
    role: role
    appId: appId
    appname: appname
    // appServiceAppName: appServiceAppName
    location: location
    workspaceId: workspaceId
    // appServicePlanName: appServicePlanName
    appServicePlanSkuName: appServicePlanSkuName
    createNewAppServicePlan: createNewAppServicePlan
    appServicePlanId: appServicePlanId
    pvtEndpointSubnetId: pvtEndpointSubnetId
    tags: tags
  }
}
//*****************************************************************************************************
*/

// Function App
//*****************************************************************************************************
module functionAppModule 'br/ACR-LAB:bicep/patterns/functionapp:v1.0.0' = {
// module functionAppModule '../../../01-COMPONENTS-and-PATTERNS/bicep-modules/modules/patterns/functionapp/simple-functionapp.bicep' = {
  name: 'functionAppModule2'
  params: {
    bu: bu
    stage: stage
    role: role
    appId: appId
    appname: appname
    // functionAppName: functionAppName
    location: location
    workspaceId: workspaceId
    // appServicePlanName: funcAppServicePlanName
    functionWorkerRuntime: functionWorkerRuntime
    appServicePlanSkuName: appServicePlanSkuName
    createNewAppServicePlan: createNewAppServicePlan
    appServicePlanId: appServicePlanId
    // funcStorageAccountName: funcStorageAccountName
    funcStorageAccountTier: funcStorageAccountTier
    funcStorageAccessTier: funcStorageAccessTier
    pvtEndpointSubnetId: pvtEndpointSubnetId
    tags: tags
  }
}
//*****************************************************************************************************

/**
// Storage Account for Data
//*****************************************************************************************************
module storageAccountModule 'br/ACR-LAB:bicep/patterns/storage-account:v1.0.0' = {
  name: 'storageAccountModule2'
  params: {
    storageAccountName: storageAccountName
    location: location
    accountTier: accountTier
    accessTier: accessTier
    workspaceId: workspaceId
    tags: tags
  }
}
//*****************************************************************************************************
*/


