param location string = 'eastus'

/*
resource hostingPlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'appsvc-function'
  location: location
  sku: {
    tier: 'Standard'
    name: 'S1'
    size: 'S1'
    family: 'S'
    capacity: 1
  }
}
*/

resource hostingPlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: 'appsvc-function3'
  location: location
  sku: {
    name: 'B1'
  }
}


resource storageAccount 'Microsoft.Storage/storageAccounts@2022-09-01' = {
  name: 'vidalstorage3'
  location: location
  kind: 'StorageV2'
  sku: {
    name: 'Standard_LRS'
  }
}

/*
resource functionApp 'Microsoft.Web/sites@2022-03-01' = {
  name: 'funcappvidal2'
  location: location
  kind: 'functionapp'
  properties: {
    serverFarmId: hostingPlan.id
    siteConfig: {
      alwaysOn: true
      appSettings: [
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: applicationInsights.properties.InstrumentationKey
        }
        {
          name: 'AzureWebJobsStorage'
          value: 'DefaultEndpointsProtocol=https;AccountName=${storageAccount.name};EndpointSuffix=${environment().suffixes.storage};AccountKey=${storageAccount.listKeys().keys[0].value}'
        }
        {
          name: 'FUNCTIONS_EXTENSION_VERSION'
          value: '~4'
        }
        {
          name: 'FUNCTIONS_WORKER_RUNTIME'
          value: 'node'
        }
        {
          name: 'WEBSITE_NODE_DEFAULT_VERSION'
          value: '~14'
        }
      ]
    }
  }
}
*/

// Function App
//*****************************************************************************************************
resource functionApp 'Microsoft.Web/sites@2022-03-01' = {
  name: toLower('funcapp-jmf-poc-automa-role-app3')
  location: location
  kind: 'functionapp'
  // identity: {
  //  type: 'SystemAssigned'
  // }
  properties: {
    serverFarmId: hostingPlan.id
    siteConfig: {
      alwaysOn: true
      appSettings: [
        {
          name: 'APPINSIGHTS_INSTRUMENTATIONKEY'
          value: applicationInsights.properties.InstrumentationKey
        }
        {
          name: 'AzureWebJobsStorage'
          value: 'DefaultEndpointsProtocol=https;AccountName=${storageAccount.name};EndpointSuffix=${environment().suffixes.storage};AccountKey=${storageAccount.listKeys().keys[0].value}'
        }
        {
          name: 'FUNCTIONS_WORKER_RUNTIME'
          value: 'node'
        }
        {
          name: 'WEBSITE_NODE_DEFAULT_VERSION'
          value: '~14'
        }
      ]
      ftpsState: 'FtpsOnly'
      minTlsVersion: '1.2'
    }
    httpsOnly: true
  }
}
//*****************************************************************************************************

// Application Insights
//*****************************************************************************************************
resource applicationInsights 'Microsoft.Insights/components@2020-02-02' = {
  // name: 'insights-${functionApp.name}'
  name: 'insights-function3'
  location: location
  kind: 'web'
  properties: {
    Application_Type: 'web'
    Request_Source: 'rest'
  }
}
//*****************************************************************************************************
