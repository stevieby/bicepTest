targetScope = 'subscription'

@description('The name of the resource group')
param resourceGroupName string

@description('The location for all resources')
param location string = 'uksouth'

@description('Environment (dev, test, prod)')
param environment string = 'dev'

// Variables
var commonTags = {
  Environment: environment
  ResourceGroup: resourceGroupName
  ManagedBy: 'Bicep'
}

// Resource Group
resource resourceGroup 'Microsoft.Resources/resourceGroups@2023-07-01' = {
  name: resourceGroupName
  location: location
  tags: commonTags
}

// Outputs
output resourceGroupName string = resourceGroup.name
output resourceGroupId string = resourceGroup.id
output location string = location
output environment string = environment
output tags object = commonTags
