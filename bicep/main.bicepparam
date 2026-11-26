using './main.bicep'

param location = 'eastus'
param resourceGroupName = 'resourcegroupclaudecode'
param environment = 'Dev'
param project = 'ClaudeCodeLab'
param owner = 'DiegoRojas'

// Replace with your real public IP before deploying
param allowedIp = '0.0.0.0/32'

// Provide via --parameters or environment-variable injection in CI/CD
// Never commit real credentials here
param adminUsername = 'CHANGE_ME'
param adminPassword = 'CHANGE_ME_Min12chars!1A'

// Must be globally unique across all Azure accounts
param storageAccountName = 'saclaudecode1987'
