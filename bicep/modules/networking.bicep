@description('Azure region')
param location string

@description('Name of the Virtual Network')
param vnetName string = 'vnetclaudecode'

@description('Address space for the VNet')
param vnetAddressPrefix string = '10.0.0.0/16'

@description('Name of the Subnet')
param subnetName string = 'snetclaudecode'

@description('Address prefix for the subnet')
param subnetAddressPrefix string = '10.0.1.0/24'

@description('Name of the NSG')
param nsgName string = 'nsgclaudecode'

@description('Source IP/CIDR allowed for SSH and RDP — replace before deploying')
param allowedIp string = '0.0.0.0/32'

@description('Tags to apply to all resources')
param tags object = {}

resource nsg 'Microsoft.Network/networkSecurityGroups@2023-09-01' = {
  name: nsgName
  location: location
  tags: tags
  properties: {
    securityRules: [
      {
        name: 'allow-ssh'
        properties: {
          priority: 100
          direction: 'Inbound'
          access: 'Allow'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: allowedIp
          destinationAddressPrefix: '*'
        }
      }
      {
        name: 'allow-rdp'
        properties: {
          priority: 110
          direction: 'Inbound'
          access: 'Allow'
          protocol: 'Tcp'
          sourcePortRange: '*'
          destinationPortRange: '3389'
          sourceAddressPrefix: allowedIp
          destinationAddressPrefix: '*'
        }
      }
    ]
  }
}

resource vnet 'Microsoft.Network/virtualNetworks@2023-09-01' = {
  name: vnetName
  location: location
  tags: tags
  properties: {
    addressSpace: {
      addressPrefixes: [vnetAddressPrefix]
    }
    subnets: [
      {
        name: subnetName
        properties: {
          addressPrefix: subnetAddressPrefix
          networkSecurityGroup: {
            id: nsg.id
          }
        }
      }
    ]
  }
}

output vnetId string = vnet.id
output subnetId string = vnet.properties.subnets[0].id
output nsgId string = nsg.id
