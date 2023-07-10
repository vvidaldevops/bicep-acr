@description('The Azure region into which the resources should be deployed.')
param location string = resourceGroup().location

@description('The name of the App Service app.')
param appServiceAppName string = 'vidal-lab-app${uniqueString(resourceGroup().id)}'

@description('The name of the App Service plan SKU.')
param appServicePlanSkuName string = 'B1'

@description('Indicates whether a CDN should be deployed.')
param deployCdn bool = true

var appServicePlanName = 'vidal-lab-plan'

// TESTING USING ACR
// App Service
module app 'br:acrlabvidal.azurecr.io/bicepmodules/appservice:v2' = {
  name: 'appservice-module-acr'
  params: {
    appServiceAppName: appServiceAppName
    appServicePlanName: appServicePlanName
    appServicePlanSkuName: appServicePlanSkuName
    location: location
  }
}

// CDN
module cdn 'br:acrlabvidal.azurecr.io/bicepmodules/cdn:v2' = {
  name: 'cdn-module-acr'
  params: {
    httpsOnly: true
    originHostName: app.outputs.appServiceAppHostName
  }
}


// To test - using a alias / short name (bicepconfig.json)
// https://learn.microsoft.com/pt-br/training/modules/share-bicep-modules-using-private-registries/6-use-module-from-registry
// https://learn.microsoft.com/pt-br/training/modules/share-bicep-modules-using-private-registries/7-exercise-use-modules-from-your-registry?pivots=cli

// module myModule 'br/MyRegistry:bicep/my-module:v1' = {
  // ...
//}

/*
@description('The Azure region into which the resources should be deployed.')
param location string = resourceGroup().location

@description('The name of the App Service app.')
param appServiceAppName string = 'devs-school-${uniqueString(resourceGroup().id)}'

@description('The name of the App Service plan SKU.')
param appServicePlanSkuName string = 'B1'

@description('Indicates whether a CDN should be deployed.')
param deployCdn bool = true


var appServicePlanName = 'devs-school-product-launch-plan'


module app 'modules/app.bicep' = {
  name: 'app'
  params: {
    appServiceAppName: appServiceAppName
    appServicePlanName: appServicePlanName
    appServicePlanSkuName: appServicePlanSkuName
    location: location
  }
}

module cdn 'modules/cdn.bicep' = if (deployCdn) {
  name: 'devs-school-launch-cdn'
  params: {
    httpsOnly: true
    originHostName: app.outputs.appServiceAppHostName
  }
}
*/

// output websiteHostName string = deployCdn ? cdn.outputs.endpointHostName : app.outputs.appServiceAppHostName

// param nsgLocation string = resourceGroup().location
// param orgNames array = [
//   'Contoso'
//   'Fabrikam'
//   'Coho'
// ]

// resource nsg 'Microsoft.Network/networkSecurityGroups@2020-06-01' = [for name in orgNames: {
//   name: 'nsg-${name}'
//   location: nsgLocation
// }]

// output deployedNSGs array = [for (name, i) in orgNames: {
//   orgName: name
//   nsgName: nsg[i].name
//   resourceId: nsg[i].id
// }]

