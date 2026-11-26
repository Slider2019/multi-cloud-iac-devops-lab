targetScope = 'subscription'

@description('Azure region for all resources')
param location string = 'eastus'

@description('Name of the Resource Group')
param resourceGroupName string = 'resourcegroupclaudecode'

@description('Deployment environment')
param environment string = 'Dev'

@description('Project name used for tagging')
param project string = 'ClaudeCodeLab'

@description('Owner name used for tagging')
param owner string = 'DiegoRojas'

@description('Source IP/CIDR allowed for SSH and RDP — replace before deploying')
param allowedIp string = '0.0.0.0/32'

@description('Administrator username for the VM')
@secure()
param adminUsername string

@description('Administrator password for the VM')
@secure()
param adminPassword string

@description('Storage Account name — globally unique')
param storageAccountName string = 'saclaudecode1987'

var tags = {
  Environment: environment
  Project: project
  Owner: owner
  ManagedBy: 'Bicep'
}

resource rg 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: resourceGroupName
  location: location
  tags: tags
}

module networking 'modules/networking.bicep' = {
  name: 'networking'
  scope: rg
  params: {
    location: location
    allowedIp: allowedIp
    tags: tags
  }
}

module compute 'modules/compute.bicep' = {
  name: 'compute'
  scope: rg
  params: {
    location: location
    subnetId: networking.outputs.subnetId
    adminUsername: adminUsername
    adminPassword: adminPassword
    tags: tags
  }
}

module storage 'modules/storage.bicep' = {
  name: 'storage'
  scope: rg
  params: {
    location: location
    storageAccountName: storageAccountName
    tags: tags
  }
}

output resourceGroupId string = rg.id
output vnetId string = networking.outputs.vnetId
output vmPublicIp string = compute.outputs.publicIpAddress
output staticWebsiteUrl string = storage.outputs.primaryWebEndpoint
