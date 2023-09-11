using './main.bicep'

param location = 'EastUS'
param business_unit = 'jmf'
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
param appservice_appname = 'lab'
param sqlserver_login = 'db_admin'
param sqlserver_groupsid = 'fe80ca0f-6dd3-44dd-ab31-14cfb3e288d8'

