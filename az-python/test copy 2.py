import os, json
from azure.identity import ClientSecretCredential
from azure.common.credentials import ServicePrincipalCredentials
from azure.mgmt.compute import ComputeManagementClient
from azure.mgmt.network import NetworkManagementClient
from azure.mgmt.resource import ResourceManagementClient, SubscriptionClient
# If you wish to debug
# logging.basicConfig(level=logging.DEBUG)

# Resource

LOCATION = 'centralindia'
GROUP_NAME = 'azure-python-test'

def run_example():
    """Resource Group management example."""
    #
    # Create the Resource Manager Client with an Application (service principal) token provider
    #
    subscription_id = os.environ.get(
        'AZURE_SUBSCRIPTION_ID',
        '62086a1d-1261-4c50-8a2d-734ed260fd8d')  # your Azure Subscription Id
    
    credential = ClientSecretCredential(
    tenant_id='a9313beb-02e5-4337-ad1e-e101ac3ec7ca',
    )

    resource_client = ResourceManagementClient(credential, subscription_id)

    compute_client = ComputeManagementClient(
        credential=credential,
        subscription_id=subscription_id
    )
    

    """  # Create Resource group
    print('\nCreate Resource Group')
    resource_group = resource_client.resource_groups.create_or_update(
        GROUP_NAME,
        {'location': LOCATION}
    )
    print(resource_group) """
       
    for vm in compute_client.virtual_machines.list_all():
        print(vm.name)
    print ("No VM")
   
if __name__ == "__main__":
    run_example()