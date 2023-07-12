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
param workspaceId string ='e6de0976-e950-49ff-9090-70784bd9b6dc'

var storageAccountName = toLower('stg-${bu}-${environment}')
// storage-bu-environment-prodname-appname-role-appId2-corepurpose

//param storageAccountName string = 'testestgvidal'

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
