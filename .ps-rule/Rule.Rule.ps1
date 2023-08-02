# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

# Synopsis: Use short rule names.
Rule 'Rule.Name' -Type 'PSRule.Rules.Rule' {
    Recommend 'Rule name should be less than 35 characters to prevent being truncated.'
    Reason 'The rule name is too long.'
    $Assert-PSRule  -InputPath 'br:' 
}