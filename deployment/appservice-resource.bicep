@description('The Azure region into which the resources should be deployed.')
param location string = resourceGroup().location

@description('The name of the App Service app.')
param appServiceAppName string = 'vidal-lab-app${uniqueString(resourceGroup().id)}'

param workspaceId string ='/subscriptions/ea93148e-4b2f-4f06-b7fb-2c8ecc309d3f/resourceGroups/DefaultResourceGroup-CUS/providers/Microsoft.OperationalInsights/workspaces/DefaultWorkspace-ea93148e-4b2f-4f06-b7fb-2c8ecc309d3f-CUS'

param appServicePlanName string = 'vidal-lab-plan'

//@description('The name of the App Service plan SKU.')
//param appServicePlanSkuName string = 'B1'

//@description('Indicates whether a CDN should be deployed.')
//param deployCdn bool = true
//param AppServicePlanID string


// App Service Plan
//module appServicePlanModule 'br/ACR-LAB:bicep/components/appserviceplan:v1' = {
//  name: 'appServicePlanModule'
//  params: {
//    location: location
//    appServicePlanName: appServicePlanName
//    workspaceId: workspaceId
//  }
//}

// App Service
module AppService 'br/ACR-LAB:bicep/patterns/appservice:v1' = {
  name: 'appservice-module'
  params: {
    appServiceAppName: appServiceAppName
    location: location
    workspaceId: workspaceId
    appServicePlanName: appServicePlanName
    //AppServicePlanID: appServicePlanModule.outputs.AppServicePlanIdB
  }
}
