# book-db-infra
This project retrieves data about existing Azure resources, stores them in a Cosmos DB, then retrieves them for visualisation.

## Usage

### Deploying the Azure infrastructure
1. Copy/clone this code to a new repository.
2. Follow this guide to create a federated identity credential for your repository https://learn.microsoft.com/en-us/azure/developer/github/connect-from-azure-openid-connect.
3. Create a storage account container named "azure-viz" on any new or existing storage account. This will be used to store Terraform state.
4. Grant the "Storage Blob Data Owner" RBAC role on the azure-viz storage account container.
5. Grant the "Storage Blob Data Contributor" RBAC role on the storage account where the container exists.
6. Add the following variables into your GitHub workspace:
    a. ARM_SUBSCRIPTION_ID - The ID of the subscription to deploy to.
    b. ARM_TENANT_ID - The ID of the Tenant to deploy to.
    c. ARM_CLIENT_ID - The application (client) ID of the service principal created in step 2.
    d. TFSTATE_STORAGE_ACCOUNT_NAME - The storage account where the Terraform state container will be stored.
4. Run the Deploy Infra GitHub Actions Workflow to plan/deploy.
