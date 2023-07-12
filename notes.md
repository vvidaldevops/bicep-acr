# Generate deployment credentials
az ad sp create-for-rbac --name BicepACR --role contributor --scopes /subscriptions/ea93148e-4b2f-4f06-b7fb-2c8ecc309d3f/resourceGroups/RG-JMF-POC-2 --sdk-auth

{
  "clientId": "6e712a4b-adb1-4d24-a1c9-5f53aca02ea9",
  "clientSecret": "4~V8Q~aNc3rGP7Ba9QetUam4nASkJsASaSfeBbV6",
  "subscriptionId": "ea93148e-4b2f-4f06-b7fb-2c8ecc309d3f",
  "tenantId": "45e46c0f-a5d5-40dd-b10b-d8311cca261e",
  "activeDirectoryEndpointUrl": "https://login.microsoftonline.com",
  "resourceManagerEndpointUrl": "https://management.azure.com/",
  "activeDirectoryGraphResourceId": "https://graph.windows.net/",
  "sqlManagementEndpointUrl": "https://management.core.windows.net:8443/",
  "galleryEndpointUrl": "https://gallery.azure.com/",
  "managementEndpointUrl": "https://management.core.windows.net/"
}




{
  "versions": [
    {
      "version": "1.0.0",
      "releaseDate": "2023-06-30",
      "author": "John Doe",
      "buildNumber": 12345,
      "description": "This is the first major release of the application.",
      "changelog": [
        {
          "version": "1.0.0",
          "date": "2023-06-30",
          "changes": [
            "Added new feature X",
            "Fixed issue Y",
            "Improved performance"
          ]
        }
      ]
    },
    {
      "version": "2.0.0",
      "releaseDate": "2023-09-15",
      "author": "Jane Smith",
      "buildNumber": 54321,
      "description": "This is a major update with significant changes.",
      "changelog": [
        {
          "version": "2.0.0",
          "date": "2023-09-15",
          "changes": [
            "Revamped user interface",
            "Added advanced functionality",
            "Optimized database queries"
          ]
        },
        {
          "version": "1.1.0",
          "date": "2023-07-10",
          "changes": [
            "Implemented feature Z",
            "Enhanced security measures"
          ]
        },
        {
          "version": "1.0.0",
          "date": "2023-06-30",
          "changes": [
            "Added new feature X",
            "Fixed issue Y",
            "Improved performance"
          ]
        }
      ]
    }
  ]
}