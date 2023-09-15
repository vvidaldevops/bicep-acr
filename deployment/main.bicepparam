using './main.bicep'

param location = ''
param stage = 'poc'
param tags = {}
param businessUnit = 'set'
param redisName = ''
param redisAppId = ''
param redisRole = ''
param redisSkuName = 'Standard'
param redisSkuFamily = 'P'
param redisCapacity = 1
param redisIdentityType = 'SystemAssigned'
param redisSubnetId = ''

