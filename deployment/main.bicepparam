using './main.bicep'

param location = 'EastUS'
param businessUnit = 'jmf'
param stage = 'dev'
param role = 'aut'
param tags = {
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
param redisName = ''
param redisAppId = 'a'
param redisSkuName = 'Standard'
param redisSkuFamily = 'P'
param redisCapacity = 1
param redisIdentityType = 'SystemAssigned'
param redisSubnetId = ''
param maxmemoryreserved = '614'

