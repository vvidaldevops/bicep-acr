// // Common Parameters
// //*****************************************************************************************************
// @description('desxcription')
// param location string = 'EastUS'
// 
// @description('desxcription')
// param business_unit string= 'jmf'
// 
// @description('desxcription')
// param stage string = 'dev'
// 
// @description('desxcription')
// param role string = 'aut'
// 
// @description('''  ''')
// param tags object = {
//     ApplicationName: 'modulestest'
//     ApplicationOwner: 'Test'
//     AppID: 'Test'
//     BU: 'SET'
//     Description: 'Test'
//     ServiceLevel: 'Test'
//     Environment: 'dev'
//     Region: 'Test'
//     Requester: 'Test'
//     Recovery: 'Test'
//     DataCI: 'Test'
// }
// 
// @description('desxcription')
// param appservice_appname string = 'lab'
// 
// param sqlserver_login string = 'db_admin'
// 
// param sqlserver_groupsid string = 'fe80ca0f-6dd3-44dd-ab31-14cfb3e288d8'
// //*****************************************************************************************************
// 
// 
// // Sql Server
// //*****************************************************************************************************
// // module sqlServer 'modules/components/Databases/sql-server/sql-server.bicep' = {
// module sqlServer '../../../01-COMPONENTS-and-PATTERNS/bicep-modules/modules/components/sql-server/sql-server.bicep' = {
// //  module sqlServer 'br:vidalabacr.azurecr.io/bicep/components/sql-server:v1.0.0' = {
//   name: 'sqlServerModule'
//   params: { 
//     business_unit: business_unit
//     stage: stage
//     location: location
//     sqlserver_tenantid: subscription().tenantId
//     // sqlserver_admLogin: sqlserver_admLogin
//     // sqlserver_admLoginPassword: sqlserver_admLoginPassword
//     sqlserver_appname: appservice_appname
//     sqlserver_role: role 
//     sqlserver_login: sqlserver_login
//     sqlserver_groupsid: sqlserver_groupsid
//     tags: tags
//   }
// }
// //*****************************************************************************************************

@description('The name of the SQL logical server.')
param serverName string = uniqueString('sql', resourceGroup().id)

@description('Location for all resources.')
param location string = resourceGroup().location

@description('The administrator username of the SQL logical server.')
param administratorLogin string = 'dbadminuser'

@description('The administrator password of the SQL logical server.')
@secure()
param administratorLoginPassword string

resource sqlServer 'Microsoft.Sql/servers@2022-05-01-preview' = {
  name: serverName
  location: location
  properties: {
    administratorLogin: administratorLogin
    administratorLoginPassword: administratorLoginPassword
  }
}

@description('Resource Tags')
param tags object
//*****************************************************************************************************

// Storage Parameters
//*****************************************************************************************************
@description('The Storage Account tier')
param accountTier string = 'Standard_LRS'

@description('Allow or Deny the storage public access. Default is false')
param allowBlobPublicAccess string = 'Allow'
//*****************************************************************************************************

// Storage Variables
//*****************************************************************************************************
@description('Storage Kind')
var storageKind = 'StorageV2'

@description('Minimum TLS Vesion')
var minimumTlsVersion = 'TLS1_2'

@description('HTTP Only?')
var HttpsTrafficOnly = true
//*****************************************************************************************************


// Storage Account Resource
//*****************************************************************************************************
resource storageAccount 'Microsoft.Storage/storageAccounts@2021-09-01' = {
  // name: storageAccountName
  name: 'teststg'
  location: location
  kind: storageKind
  sku: {
    name: accountTier
  }
  properties: {
    networkAcls: {
      defaultAction: allowBlobPublicAccess
      bypass: 'AzureServices'
    }
    accessTier: 'Hot'
    allowCrossTenantReplication: false
    allowSharedKeyAccess: true
    encryption: {
      keySource: 'Microsoft.Storage'
      requireInfrastructureEncryption: true
      services: {
        blob: {
          enabled: true
        }
        file: {
          enabled: true
        }
      }
    }    
    minimumTlsVersion: minimumTlsVersion
    supportsHttpsTrafficOnly: HttpsTrafficOnly 
  }
  tags: tags
}
output storageAccountId string = storageAccount.id
output storageAccountName string = storageAccount.name
//*****************************************************************************************************
