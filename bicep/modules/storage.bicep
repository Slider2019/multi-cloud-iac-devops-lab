@description('Azure region')
param location string

@description('Storage Account name — globally unique, 3-24 lowercase alphanumeric')
param storageAccountName string = 'saclaudecode1987'

@description('Storage Account SKU')
param sku string = 'Standard_LRS'

@description('Index document for the static website')
param indexDocument string = 'index.html'

@description('Error 404 document for the static website')
param error404Document string = '404.html'

@description('Tags to apply to all resources')
param tags object = {}

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: storageAccountName
  location: location
  tags: tags
  sku: {
    name: sku
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    minimumTlsVersion: 'TLS1_2'
    allowBlobPublicAccess: true
  }
}

resource blobService 'Microsoft.Storage/storageAccounts/blobServices@2023-01-01' = {
  parent: storageAccount
  name: 'default'
}

// Static website is enabled via the $web container + storage account property
// ARM/Bicep exposes it through the storageAccount properties extension
resource staticWebsite 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01' = {
  parent: blobService
  name: '$web'
  properties: {
    publicAccess: 'Blob'
  }
}

output storageAccountId string = storageAccount.id
output storageAccountName string = storageAccount.name
output primaryWebEndpoint string = 'https://${storageAccount.name}.z13.web.core.windows.net/'
output primaryBlobEndpoint string = storageAccount.properties.primaryEndpoints.blob
