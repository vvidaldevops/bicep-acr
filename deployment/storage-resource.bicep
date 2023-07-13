/*
@allowed([
  'prod'
  'nonprod'
])
param environment string = 'nonprod'

@allowed([
  'setf'
  'jmfe'
])

param bu string = 'jmfe'

*/

//var storageAccountName = toLower('stg-${bu}-${environment}')
// storage-bu-environment-prodname-appname-role-appId2-corepurpose
param workspaceId string ='/subscriptions/ea93148e-4b2f-4f06-b7fb-2c8ecc309d3f/resourceGroups/DefaultResourceGroup-CUS/providers/Microsoft.OperationalInsights/workspaces/DefaultWorkspace-ea93148e-4b2f-4f06-b7fb-2c8ecc309d3f-CUS'
param storageAccountName string = 'testestgvidal'
param location string = 'eastus'
param accountTier string = 'Standard_LRS'

//module storageAccountModule 'br:vidalabacr.azurecr.io/bicep/patterns/simple-storage:v1' = {
// Using alias in the module path.  
module storageAccountModule 'br/ACR-LAB:bicep/patterns/simple-storage:v1' = {
  name: 'storageAccountModule3'
  params: {
    storageAccountName: storageAccountName
    location: location
    accountTier: accountTier
    workspaceId: workspaceId
  }
}

// output storageAccountId string = storageAccountModule.outputs.storageAccountId
//output storageAccountConnectionString string = storageAccountModule.outputs.storageAccountConnectionString
//
