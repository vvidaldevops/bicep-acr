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
