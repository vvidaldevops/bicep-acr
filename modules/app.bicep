@description('The Azure region into which the resources should be deployed.')
param location string

@description('The name of the App Service app.')
param appServiceAppName string

@description('The name of the App Service plan.')
param appServicePlanName string

@description('The name of the App Service plan SKU.')
param appServicePlanSkuName string

resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: appServicePlanSkuName
  }
}

resource appServiceApp 'Microsoft.Web/sites@2022-03-01' = {
  name: appServiceAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

output appServiceAppHostName string = appServiceApp.properties.defaultHostName

/*
// ### TESTING DIAG SETTINGS ###
param resourceName string
//param diagnosticMetrics array
param storageAccountId string

resource diagnosticSettings 'Microsoft.Insights/diagnosticSettings@2021-05-01-preview' = {
  name: 'diag-${resourceName}'
  properties: {
    logs: [
      {
        category: 'AppServiceEnvironmentPlatformLogs'
        enabled: true
      }
    ]
    metrics: [
      {
      category: 'CpuPercentage'
      enabled: true
      }
    ]
    storageAccountId: storageAccountId
  }
}

output diagnosticSettingsId string = diagnosticSettings.id

*/

// output stringOutput string = deployment().name
// output integerOutput int = length(environment().authentication.audiences)
// output booleanOutput bool = contains(deployment().name, 'demo')
// output arrayOutput array = environment().authentication.audiences
// output objectOutput object = subscription()


// var user = {
//   'user-name': 'Test Person'
// }

// output stringOutput string = user['user-name']
