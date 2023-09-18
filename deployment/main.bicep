// Common Parameters
//*****************************************************************************************************
@description('desxcription')
param location string = 'EastUS'

@description('desxcription')
param businessUnit string= 'jmf'

@description('desxcription')
param stage string = 'dev'

@description('desxcription')
param role string = 'aut'

@description('''  ''')
param tags object = {
    ApplicationName: 'modulestest'
    ApplicationOwner: 'Test'
    AppID: 'Test'
    BU: 'SET'
    Description: 'Test'
    ServiceLevel: 'Test'
    Environment: 'dev'
    Region: 'Test'
    Requester: 'Test'
    Recovery: 'Test'
    DataCI: 'Test'
}
//*****************************************************************************************************


// Required Parameters - Azure Cache for Redis
//*****************************************************************************************************
@description('(Require) The application name. Nine (9) characters maximum')
@maxLength(9)
param redisName string

@description('(Require) The role of the resource. Two (2) characters maximum')
@maxLength(2)
param redisAppId string = 'a'

@description('The type of Redis cache to deploy. Valid values: (Basic, Standard, Premium)')
@allowed([
  'Basic'
  'Standard'
  'Premium'
])
param redisSkuName string = 'Standard'

@description('(The SKU family to use. Valid values: (C, P). (C = Basic/Standard, P = Premium (required)).')
@allowed([
  'C'
  'P'
])
param redisSkuFamily string = 'P'

@description('The size of the Redis cache to deploy. Valid values: for C (Basic/Standard) family (0, 1, 2, 3, 4, 5, 6), for P (Premium) family (1, 2, 3, 4).')
@allowed([
  1
  2 
  3 
  4
])
param redisCapacity int = 1

@description('The identity of the resource.')
@allowed([
  'SystemAssigned'
  'UserAssigned'
  'UserAssigned, SystemAssigned'
])
param redisIdentityType string = 'SystemAssigned'

@description('The full resource ID of a subnet in a virtual network to deploy the Redis cache in. Example format: /subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/Microsoft.{Network,ClassicNetwork}/VirtualNetworks/vnet1/subnets/subnet1')
param redisSubnetId string = ''
//*****************************************************************************************************

// Azure Cache for Redis
//*****************************************************************************************************
module redisCache 'br:vidalabacr.azurecr.io/bicep/components/redis:v1.0.0' = {
  name: 'redisCacheModule'
  params: {
    businessUnit: businessUnit
    stage: stage
    redisName: redisName
    redisAppId: redisAppId
    redisRole: role
    redisSkuName: redisSkuName
    redisSkuFamily: redisSkuFamily
    redisCapacity: redisCapacity
    redisIdentityType: redisIdentityType
    location: location
    // workspaceId: workspaceId
    redisSubnetId: redisSubnetId
    tags: tags
  }
}
// //*****************************************************************************************************
