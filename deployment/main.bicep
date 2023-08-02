// Common Parameters
//*****************************************************************************************************
@description('The Azure region into which the resources should be deployed.')
@allowed([
  'eastus'
])
param location string

@allowed([ 'set', 'setf', 'jmf', 'jmfe' ])
param bu string

@allowed([ 'poc', 'dev', 'qa', 'uat', 'prd' ])
param stage string

@maxLength(6)
param role string

@maxLength(2)
param appId string

@maxLength(6)
param appname string

param tags object

@description('The ID of Log Analytics Workspace.')
param workspaceId string

@description('The ID from Private Endpoint Subnet. If specified then the private endpoint will be created and associated to the Private Endpoint Subnet')
param pvtEndpointSubnetId string
//*****************************************************************************************************

// App Service Plan Parameters
//*****************************************************************************************************
@description('Indicates whether AppServicePlan should be created or using an existing one.')
param createNewAppServicePlan bool

@description('If the above option is = true, the existing App Service Plan ID should be provided.')
param existingappServicePlanId string

@description('The name of the App Service plan SKU.')
param appServicePlanSkuName string

@description('The kind of the App Service plan.')
param appServicePlanKind string

@description('The tier of the App Service plan.')
param appServicePlanTier string
//*****************************************************************************************************

// App Service Parameters
//*****************************************************************************************************
param appServiceEndpointVnetName string
param appServiceEndpointSubnetName string
//*****************************************************************************************************

// Function App Parameters
//*****************************************************************************************************
@description('Indicates whether AppServicePlan should be created or using an existing one.')
param createNewFcnServicePlan bool

@description('If the above option is = true, the existing App Service Plan ID should be provided.')
param existingFcnServicePlanId string

@description('The language worker runtime to load in the function app.')
@allowed([
  'node'
  'dotnet'
  'java'
])
param functionWorkerRuntime string

@description('The Storage Account tier')
param funcStorageAccountTier string

@description('The name from Function Service Endpoint VNET.')
param funcServiceEndpointVnetName string

@description('The name from Function Service Endpoint Subnet.')
param funcServiceEndpointSubnetName string

@description('The name from Function Storage Service Endpoint VNET.')
param funcStgServiceEndpointvNetName string

@description('The name from Function Storage Service Endpoint Subnet.')
param funcStgServiceEndpointSubnetName string
//*****************************************************************************************************

// Storage Account Parameters
//*****************************************************************************************************
@description('Storage Account type')
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
param accountTier string

@description('Allow or Deny the storage public access. Default is Deny')
param allowBlobPublicAccess string

@description('The name from Service Endpoint VNET.')
param stgServiceEndpointVnetName string

@description('The name from Service Endpoint Subnet.')
param stgServiceEndpointSubnetName string

@description('The Storage Account access tier')
param accessTier string
//*****************************************************************************************************


// App Service
//*****************************************************************************************************
//module appService 'br:vidalabacr.azurecr.io/bicep/patterns/appservice:v1.0.0' = {
//module appService 'br/ACR-LAB:bicep/patterns/appservice:v1.0.0' = {
module appService '../../../01-COMPONENTS-and-PATTERNS/bicep-modules/modules/patterns/appservice/simple-appservice.bicep' = {
  name: 'appServiceModule2'
  params: {
    bu: bu
    stage: stage
    role: role
    appId: appId
    appname: appname
    location: location
    workspaceId: workspaceId
    appServicePlanSkuName: appServicePlanSkuName
    appServicePlanKind: appServicePlanKind
    appServicePlanTier: appServicePlanTier
    appServiceEndpointVnetName: appServiceEndpointVnetName
    appServiceEndpointSubnetName: appServiceEndpointSubnetName
    createNewAppServicePlan: createNewAppServicePlan
    existingappServicePlanId: existingappServicePlanId
    pvtEndpointSubnetId: pvtEndpointSubnetId
    tags: tags
  }
}
//*****************************************************************************************************


// Function App
//*****************************************************************************************************
module functionAppModule 'br:vidalabacr.azurecr.io/bicep/patterns/functionapp:v1.0.0' = {
// module functionAppModule '../../../01-COMPONENTS-and-PATTERNS/bicep-modules/modules/patterns/functionapp/simple-functionapp.bicep' = {
  name: 'functionAppModule2'
  params: {
    bu: bu
    stage: stage
    role: role
    appId: appId
    appname: appname
    location: location
    workspaceId: workspaceId
    functionWorkerRuntime: functionWorkerRuntime
    appServicePlanSkuName: appServicePlanSkuName
    funcServiceEndpointVnetName: funcServiceEndpointVnetName
    funcServiceEndpointSubnetName: funcServiceEndpointSubnetName
    funcStgServiceEndpointSubnetName: funcStgServiceEndpointSubnetName
    funcStgServiceEndpointvNetName: funcStgServiceEndpointvNetName
    createNewFcnServicePlan: createNewFcnServicePlan
    existingFcnServicePlanId: existingFcnServicePlanId
    funcStorageAccountTier: funcStorageAccountTier
    pvtEndpointSubnetId: pvtEndpointSubnetId
    tags: tags
  }
}
//*****************************************************************************************************


// Storage Account for Data
//*****************************************************************************************************
module storageAccountModule 'br:vidalabacr.azurecr.io/bicep/patterns/storage-account:v1.0.0' = {
// module storageAccountModule 'br/ACR-LAB:bicep/patterns/storage-account:v1.0.0' = {
// module storageAccountModule '../../../01-COMPONENTS-and-PATTERNS/bicep-modules/modules/patterns/storage-account/simple-storage.bicep' = {  
  name: 'storageAccountModule2'
  params: {
    bu: bu
    stage: stage
    role: role
    appId: appId
    appname: appname
    location: location
    accountTier: accountTier
    accessTier: accessTier
    allowBlobPublicAccess: allowBlobPublicAccess
    stgServiceEndpointVnetName: stgServiceEndpointVnetName
    stgServiceEndpointSubnetName: stgServiceEndpointSubnetName
    workspaceId: workspaceId
    tags: tags
  }
}
//******************************************************************************************************
