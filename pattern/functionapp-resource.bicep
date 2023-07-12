// To be TESTED !!!
param functionName string
param resourceGroupName string
param location string
param appServicePlanModulePath string
param storageAccountModulePath string

// Change to the modules ***
module appServicePlan 'appServicePlan' = {
  name: 'appServicePlan'
  path: appServicePlanModulePath
  params: {
    appServicePlanName: 'myAppServicePlan'
    resourceGroupName: resourceGroupName
    location: location
  }
}

// Change to the modules ***
module storageAccount 'storageAccount' = {
  name: 'storageAccount'
  path: storageAccountModulePath
  params: {
    storageAccountName: 'myStorageAccount'
    resourceGroupName: resourceGroupName
    location: location
  }
}

// Change to the modules ***
resource functionApp 'Microsoft.Web/sites@2021-02-01' = {
  name: functionName
  location: location
  properties: {
    serverFarmId: appServicePlan.outputs.appServicePlanId
    siteConfig: {
      appSettings: [
        {
          name: 'AzureWebJobsStorage'
          value: storageAccount.outputs.storageAccountConnectionString
        }
      ]
    }
  }
}

output functionAppEndpoint string = functionApp.properties.defaultHostName
