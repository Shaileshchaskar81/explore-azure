import json
import os

from azure.identity import AzureCliCredential, DefaultAzureCredential
from azure.mgmt.compute import ComputeManagementClient
from azure.mgmt.resource import ResourceManagementClient


def run_example():
    subscription_id = os.environ.get('AZURE_SUBSCRIPTION_ID','62086a1d-1261-4c50-8a2d-734ed260fd8d')  # your Azure Subscription Id
    credential = DefaultAzureCredential()        
    #credential = AzureCliCredential()
    resource_client = ResourceManagementClient(credential, subscription_id)
    compute_client = ComputeManagementClient(credential=credential,subscription_id=subscription_id)
    print('\nCreate Resource Group')
    group_list = resource_client.resource_groups.list()
    for group in list(group_list):
        print(group.name, ":", group.location)
       
    for vm in compute_client.virtual_machines.list_all():
        print(vm.name)
        print(vm.identity.identity_ids)
    print ("No VM")
    
    print (compute_client.virtual_machines.list)
    for vm in compute_client.virtual_machines.list_all():
        if vm.name == 'aa':
            print(vm.name)
            print(vm.identity.__getattribute__)
    print ("No VM")
   
if __name__ == "__main__":
    run_example()