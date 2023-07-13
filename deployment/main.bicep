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

// Storage Parameters
param storageAccountName string = 'testestgvidal'
param accountTier string = 'Standard_LRS'

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
