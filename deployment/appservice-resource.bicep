@description('The Azure region into which the resources should be deployed.')
param location string = resourceGroup().location

@description('The name of the App Service app.')
param appServiceAppName string = 'vidal-lab-app${uniqueString(resourceGroup().id)}'

param workspaceId string ='/subscriptions/ea93148e-4b2f-4f06-b7fb-2c8ecc309d3f/resourceGroups/DefaultResourceGroup-CUS/providers/Microsoft.OperationalInsights/workspaces/DefaultWorkspace-ea93148e-4b2f-4f06-b7fb-2c8ecc309d3f-CUS'


//@description('The name of the App Service plan SKU.')
//param appServicePlanSkuName string = 'B1'

//@description('Indicates whether a CDN should be deployed.')
//param deployCdn bool = true

var appServicePlanName = 'vidal-lab-plan'

// App Service
module app 'br/ACR-LAB:bicep/components/appservice:v1' = {
  name: 'appservice-module-acr'
  params: {
    appServiceAppName: appServiceAppName
    appServicePlanName: appServicePlanName
    location: location
    workspaceId: workspaceId
    //appServicePlanId: appServicePlanModule.outputs.appServicePlanId
  }
}
