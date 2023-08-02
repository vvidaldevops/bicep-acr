# Synopsis: Consider freeing up registry space.
#Rule 'Azure.ACR.Usage' -Ref 'AZR-000001' -Type 'Microsoft.ContainerRegistry/registries' -If { IsExport } -Tag @{ release = 'GA'; ruleSet = '2020_12'; 'Azure.WAF/pillar' = 'Cost Optimization'; method = 'in-flight'; } {
#    $usages = @(GetSubResources -ResourceType 'Microsoft.ContainerRegistry/registries/listUsages' | ForEach-Object {
#        $_.value | Where-Object { $_.Name -eq 'Size' }
#    });
#    if ($usages.Length -gt 0) {
#        foreach ($usage in $usages) {
#            $Assert.LessOrEqual([int]($usage.currentValue/$usage.limit*100), '.', 90);
#        }
#    }
#}

#Rule 'Azure.Storage.SoftDelete' -Ref 'AZR-000197' -Type 'Microsoft.Storage/storageAccounts', 'Microsoft.Storage/storageAccounts/blobServices' -If { !(IsCloudShell) -and !(IsHnsStorage) -and !(IsFileStorage) } -Tag @{ release = 'GA'; ruleSet = '2020_06' } {
#    $services = @($TargetObject);
#    if ($PSRule.TargetType -eq 'Microsoft.Storage/storageAccounts') {
#        $services = @(GetSubResources -ResourceType 'Microsoft.Storage/storageAccounts/blobServices');
#    }
#    if ($services.Length -eq 0) {
#        return $Assert.Fail($LocalizedData.SubResourceNotFound, 'Microsoft.Storage/storageAccounts/blobServices');
#    }
#    foreach ($service in $services) {
#        $Assert.HasFieldValue($service, 'properties.deleteRetentionPolicy.enabled', $True);
#    }
#}

## TESTS
#Rule 'Azure.ValidateACR.name' -Ref 'AZR-000001' -Type 'Microsoft.ContainerRegistry/registries' -If { IsExport } -Tag @{ release = 'GA'; ruleSet = '2020_12'; 'Azure.WAF/pillar' = 'Cost Optimization'; method = 'in-flight'; } {
#    # Specify the file path
#    $file = "../deployemnt/main.bicep"
#
#    # Read the content of the file
#    $fileContent = Get-Content -Path $file -Raw
#
#    # Search for occurrences of 'br:' and '.azurecr.io'
#    $brMatches = $fileContent | Select-String -Pattern 'br:'
#    #$azurecrMatches = $fileContent | Select-String -Pattern '.azurecr.io'
#
#    # Output the results
#    if ($brMatches) {
#        Write-Host "Found 'br:' in the file."
#    } else {
#        Write-Host "No occurrences of 'br:' in the file."
#    }
#
#    #if ($azurecrMatches) {
#    #    Write-Host "Found '.azurecr.io' in the file."
#    #} else {
#    #    Write-Host "No occurrences of '.azurecr.io' in the file."
#    #}
#    }

# customRule.ps1
rule Azure.ValidateACR.Rule {
    #param ($target)

    # Specify the file path
    $file = "../deployment/main.bicep"
    
    # Read the content of the file
    $fileContent = Get-Content -Path $file -Raw

    $containsAcrModules = $fileContent -match ':br'

    if ($containsAcrModules) {
        return @{
            Message = "The file $($file) is using ACR Modules"
            Result = 'PASS'
        }
    }
    else {
        return @{
            Message = "The file $($file) is not using ACR Modules"
            Result = 'FAIL'
        }
    }
}

