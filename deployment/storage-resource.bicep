// Parameters
param workspaceId string ='/subscriptions/ea93148e-4b2f-4f06-b7fb-2c8ecc309d3f/resourceGroups/DefaultResourceGroup-CUS/providers/Microsoft.OperationalInsights/workspaces/DefaultWorkspace-ea93148e-4b2f-4f06-b7fb-2c8ecc309d3f-CUS'
param storageAccountName string = 'testestgvidal'
param location string = 'eastus'
param accountTier string = 'Standard_LRS'

//-----------------------------------------------------------------------------------------------

// Storage Account
module storageAccountModule 'br/ACR-LAB:bicep/patterns/simple-storage:v1' = {
  name: 'storageAccountModule3'
  params: {
    storageAccountName: storageAccountName
    location: location
    accountTier: accountTier
    workspaceId: workspaceId
  }
}
