// TESTS USING NAME CONVENTION
@allowed([ 'set', 'setf', 'jmf', 'jmfe' ])
param bu string = 'jmf'

@allowed([ 'poc', 'dev', 'qa', 'uat', 'pro[d' ])
param environment string = 'poc'

@maxLength(6)
param role string = 'automa'

@maxLength(2)
param appId string = '01'

@maxLength(6)
param appname string = 'App123'

// Storage Parameters

@description('Provide a globally unique name for the Storage Account')
@minLength(3)
@maxLength(24)
param storageAccountName string = toLower('stg${bu}${environment}${appname}${role}${appId}')
// storage-bu-environment-prodname-appname-role-appId2-corepurpose
param accountTier string = 'Standard_LRS'

// Common Parameters
@description('The Azure region into which the resources should be deployed.')
param location string = resourceGroup().location

@description('The ID of Log Analytics Workspace.')
param workspaceId string ='/subscriptions/ea93148e-4b2f-4f06-b7fb-2c8ecc309d3f/resourceGroups/DefaultResourceGroup-CUS/providers/Microsoft.OperationalInsights/workspaces/DefaultWorkspace-ea93148e-4b2f-4f06-b7fb-2c8ecc309d3f-CUS'

//------------------------------------------------------------------------------------------------

// App Service Parameters
@description('The name of the App Service.')
param appServiceAppName string = 'vidal-lab-app${uniqueString(resourceGroup().id)}'

@description('The name of the App Service Plan.')
param appServicePlanName string = 'vidal-lab-plan'

//@description('The name of the App Service plan SKU.')
//param appServicePlanSkuName string = 'B1'

//@description('Indicates whether a AppServicePlan should be deployed.')
//param deployAppServicePlan bool = false

//------------------------------------------------------------------------------------------------



//------------------------------------------------------------------------------------------------

// App Service
 module appService 'br/ACR-LAB:bicep/patterns/simple-appservice:v1' = {
  name: 'appServiceModule2'
  params: {
    appServiceAppName: appServiceAppName
    location: location
    workspaceId: workspaceId
    appServicePlanName: appServicePlanName
  }
}

//-----------------------------------------------------------------------------------------------

// Storage Account
module storageAccountModule 'br/ACR-LAB:bicep/patterns/simple-storage:v1' = {
  name: 'storageAccountModule2'
  params: {
    storageAccountName: storageAccountName
    location: location
    accountTier: accountTier
    workspaceId: workspaceId
  }
}
