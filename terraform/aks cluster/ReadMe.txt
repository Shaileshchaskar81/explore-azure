https://learn.microsoft.com/en-us/azure/developer/terraform/create-k8s-cluster-with-tf-and-aks
https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli
https://learn.microsoft.com/en-us/azure/developer/terraform/get-started-windows-powershell?tabs=bash
https://learn.microsoft.com/en-us/azure/virtual-machines/linux/ssh-from-windows 
https://learn.microsoft.com/en-us/azure/developer/terraform/get-started-windows-powershell?tabs=bash#5-authenticate-terraform-to-azure 
https://learn.microsoft.com/en-us/azure/container-registry/container-registry-helm-repos#enable-oci-support 



PS C:\Users\Shailesh> az login
A web browser has been opened at https://login.microsoftonline.com/organizations/oauth2/v2.0/authorize. Please continue the login in the web browser. If no web browser is available or if the web browser fails to open, use device code flow with `az login --use-device-code`.
[
  {
    "cloudName": "AzureCloud",
    "homeTenantId": "a9313beb-02e5-4337-ad1e-e101ac3ec7ca",
    "id": "556a8191-80bf-4752-b4de-c25ad263abf2",
    "isDefault": true,
    "managedByTenants": [],
    "name": "Pay-As-You-Go",
    "state": "Enabled",
    "tenantId": "a9313beb-02e5-4337-ad1e-e101ac3ec7ca",
    "user": {
      "name": "schaskar.ml@gmail.com",
      "type": "user"
    }
  }
]
PS C:\Users\Shailesh> az aks list
[]
PS C:\Users\Shailesh> az account show
{
  "environmentName": "AzureCloud",
  "homeTenantId": "a9313beb-02e5-4337-ad1e-e101ac3ec7ca",
  "id": "556a8191-80bf-4752-b4de-c25ad263abf2",
  "isDefault": true,
  "managedByTenants": [],
  "name": "Pay-As-You-Go",
  "state": "Enabled",
  "tenantId": "a9313beb-02e5-4337-ad1e-e101ac3ec7ca",
  "user": {
    "name": "schaskar.ml@gmail.com",
    "type": "user"
  }
}
PS C:\Users\Shailesh> az account list --query "[?user.name=='<microsoft_account_email>'].{Name:name, ID:id, Default:isDefault}" --output Table

PS C:\Users\Shailesh> az account list --query "[?user.name=='schaskar.ml@gmail.com'].{Name:name, ID:id, Default:isDefault}" --output Table
Name           ID                                    Default
-------------  ------------------------------------  ---------
Pay-As-You-Go  556a8191-80bf-4752-b4de-c25ad263abf2  True
PS C:\Users\Shailesh> az account set --subscription "556a8191-80bf-4752-b4de-c25ad263abf2"
PS C:\Users\Shailesh>


PS C:\Users\Shailesh> az account show
{
  "environmentName": "AzureCloud",
  "homeTenantId": "a9313beb-02e5-4337-ad1e-e101ac3ec7ca",
  "id": "556a8191-80bf-4752-b4de-c25ad263abf2",
  "isDefault": true,
  "managedByTenants": [],
  "name": "Pay-As-You-Go",
  "state": "Enabled",
  "tenantId": "a9313beb-02e5-4337-ad1e-e101ac3ec7ca",
  "user": {
    "name": "schaskar.ml@gmail.com",
    "type": "user"
  }
}
PS C:\Users\Shailesh> az ad sp create-for-rbac
The output includes credentials that you must protect. Be sure that you do not include these credentials in your code or check the credentials into your source control. For more information, see https://aka.ms/azadsp-cli
{
  "appId": "5f5ee245-b1af-45de-bc6e-afb35506c66c",
  "displayName": "azure-cli-2022-10-23-15-26-01",
  "password": "Sj.8Q~H7qTrM04fMgNW9WFq32TUUdn4~~WhCYajl",
  "tenant": "a9313beb-02e5-4337-ad1e-e101ac3ec7ca"
}

az ad sp create-for-rbac --name myaksTerraform --role Contributor --scopes /subscriptions/556a8191-80bf-4752-b4de-c25ad263abf2

PS C:\Users\Shailesh> az login --service-principal --username "556a8191-80bf-4752-b4de-c25ad263abf2" --password "Sj.8Q~H7qTrM04fMgNW9WFq32TUUdn4~~WhCYajl" --tenant "a9313beb-02e5-4337-ad1e-e101ac3ec7ca"
AADSTS700016: Application with identifier '556a8191-80bf-4752-b4de-c25ad263abf2' was not found in the directory 'Default Directory'. This can happen if the application has not been installed by the administrator of the tenant or consented to by any user in the tenant. You may have sent your authentication request to the wrong tenant.
Trace ID: c86a866a-7bea-47f9-bd77-ca6b82a02200
Correlation ID: b087cbda-47ac-4b88-8331-bc7144fa0e0a
Timestamp: 2022-10-23 15:35:21Z
To re-authenticate, please run:
az login
PS C:\Users\Shailesh> az ad sp create-for-rbac --name myaksTerraform --role Contributor --scopes /subscriptions/556a8191-80bf-4752-b4de-c25ad263abf2
Please run 'az login' to setup account.
PS C:\Users\Shailesh> az login
A web browser has been opened at https://login.microsoftonline.com/organizations/oauth2/v2.0/authorize. Please continue the login in the web browser. If no web browser is available or if the web browser fails to open, use device code flow with `az login --use-device-code`.
[
  {
    "cloudName": "AzureCloud",
    "homeTenantId": "a9313beb-02e5-4337-ad1e-e101ac3ec7ca",
    "id": "556a8191-80bf-4752-b4de-c25ad263abf2",
    "isDefault": true,
    "managedByTenants": [],
    "name": "Pay-As-You-Go",
    "state": "Enabled",
    "tenantId": "a9313beb-02e5-4337-ad1e-e101ac3ec7ca",
    "user": {
      "name": "schaskar.ml@gmail.com",
      "type": "user"
    }
  }
]
PS C:\Users\Shailesh> az account set --subscription "556a8191-80bf-4752-b4de-c25ad263abf2"
PS C:\Users\Shailesh> az ad sp create-for-rbac --name myaksTerraform --role Contributor --scopes /subscriptions/556a8191-80bf-4752-b4de-c25ad263abf2
Creating 'Contributor' role assignment under scope '/subscriptions/556a8191-80bf-4752-b4de-c25ad263abf2'
The output includes credentials that you must protect. Be sure that you do not include these credentials in your code or check the credentials into your source control. For more information, see https://aka.ms/azadsp-cli
{
  "appId": "d6adfb30-53e3-4719-aba8-7ebff0416131",
  "displayName": "myaksTerraform",
  "password": "dPM8Q~GUdkvISvfUvsWQ9BsJemSGgRe6r.CSFbin",
  "tenant": "a9313beb-02e5-4337-ad1e-e101ac3ec7ca"
}
PS C:\Users\Shailesh>



az login --service-principal --username "d6adfb30-53e3-4719-aba8-7ebff0416131" --password "dPM8Q~GUdkvISvfUvsWQ9BsJemSGgRe6r.CSFbin" --tenant "a9313beb-02e5-4337-ad1e-e101ac3ec7ca"
PS C:\Users\Shailesh> az login --service-principal --username "d6adfb30-53e3-4719-aba8-7ebff0416131" --password "dPM8Q~GUdkvISvfUvsWQ9BsJemSGgRe6r.CSFbin" --tenant "a9313beb-02e5-4337-ad1e-e101ac3ec7ca"
[
  {
    "cloudName": "AzureCloud",
    "homeTenantId": "a9313beb-02e5-4337-ad1e-e101ac3ec7ca",
    "id": "556a8191-80bf-4752-b4de-c25ad263abf2",
    "isDefault": true,
    "managedByTenants": [],
    "name": "Pay-As-You-Go",
    "state": "Enabled",
    "tenantId": "a9313beb-02e5-4337-ad1e-e101ac3ec7ca",
    "user": {
      "name": "d6adfb30-53e3-4719-aba8-7ebff0416131",
      "type": "servicePrincipal"
    }
  }
]
PS C:\Users\Shailesh>

PS C:\Users\Shailesh> ssh-keygen -m PEM -t rsa -b 2048
Generating public/private rsa key pair.
Enter file in which to save the key (C:\Users\Shailesh/.ssh/id_rsa): mypubkey
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in mypubkey.
Your public key has been saved in mypubkey.pub.
The key fingerprint is:
SHA256:nIT6VJ3jTViYzpo+QABcN40bXMXZMDLS10eftgEm16E shailesh@MyCloudPlayGround
The key's randomart image is:
+---[RSA 2048]----+
| ..o..+=+o+O.=o..|
|  . ..++o+*=* +o.|
|     ..oo+= .E +.|
|     .o+ oo+  . o|
|    ... So. .  . |
|     o. o        |
|      .o         |
|        o        |
|         .       |
+----[SHA256]-----+
PS C:\Users\Shailesh> ls -lrth
Get-ChildItem: A parameter cannot be found that matches parameter name 'lrth'.
PS C:\Users\Shailesh> ls

    Directory: C:\Users\Shailesh

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d----          23-10-2022    21:12                .azure
d----          09-09-2022    18:58                .docker
d----          24-10-2022    13:08                .kube
d----          01-09-2022    01:45                .minikube
d----          01-09-2022    01:45                .redhat
d----          01-09-2022    01:54                .ssh
d----          01-09-2022    01:35                .vs-kubernetes
d----          01-09-2022    01:27                .vscode
d-r--          31-08-2022    21:55                Contacts
d----          24-10-2022    13:10                Documents
d-r--          24-10-2022    13:32                Downloads
d-r--          31-08-2022    21:55                Favorites
d----          01-09-2022    01:03                getting-started
d-r--          31-08-2022    21:55                Links
d-r--          31-08-2022    21:55                Music
lar--          24-10-2022    13:10                OneDrive
d-r--          31-08-2022    21:55                Saved Games
d-r--          01-09-2022    00:21                Searches
d-r--          03-09-2022    17:16                Videos
-a---          09-09-2022    19:33       41958912 kubectl-convert.exe
-a---          09-09-2022    19:33             64 kubectl-convert.exe.sha256
-a---          24-10-2022    13:35           1679 mypubkey
-a---          24-10-2022    13:35            409 mypubkey.pub

PS C:\Users\Shailesh> cat .\mypubkey
-----BEGIN RSA PRIVATE KEY-----
MIIEpAIBAAKCAQEA3DkYc7pdodJywlEMPtwuA0lhk8LlXOcPGMCC+OZ2eKaaRK38
8vk8J2tWQaF9pIQRNEaQmxrVGReUpHz1j/OmlkIU8hcMqOHqY0wh3/qVIrbfxQKl
va5L4F1Eezgmb0+UqwHLm6iEpAkMjKjI327WThwXINM54d0mdc+MP3w2aasOUxC5
tnzGI5Bv2QSld6rcWwSnZXPocXKz/I2CL4nYkYe33MZoZz9LbmhuJ1SeETcvZTbl
+B2NLv00JPOdos4034SV6yliE0ray1wpMJ1zlP1Rfy2DygHGZyo8mJ6gmVq4IsW7
/DB85tIX8TVaertkWtaydwhmjkadVTBHFK4XQwIDAQABAoIBAHexgJzF2kYtv7nl
myY/PbMDm0lYUJlh7E6js4vclt+UjZxuhGD7Hbq/GC6ru0JDlaY4BDiJKPFuY5fT
YxROdWiNmhzKclMIFwDJTFAUPiKUCqNlgPfLV+omRyZBqoItWrxnSWbc/Nq7IFsD
Ecp+z3O8yMVKiNc9/71ghPWsaVacY70UrfC7Kr5l60uPi5M5MsCMPn9Q0sSbISLG
W5hs1oQITol9+KeS4QVO+EJAEy4nf6uN/jt775CBDWS8QU5WYtkq0zmojz+UynIF
RJTATFsbNfKUwv1sCQQR8OcG6RClgv0dhTK1AA81q4MxG4oteCUQOj1+isIySC+p
pUmsaeECgYEA+qcgxYKjb0ola/lQBDo2S/LVdNx7C0O7hdE2t4hqK1LDPFo2VC/s
WK79jjXGlcOqCpCu9vdBAhjzK5Fl1ythmwF4zHQLAELFH0vK8qDsQIO/ZpvB4/LK
tXbZXdAaw8OLn1C2n/GG10tew2z9Fuwd7B1L1FJOVwmZjguOJqw+LNUCgYEA4OvI
jC65UWA9quNzfkqdxj0+AmoLVXpuFzb8ThF1hotU5LbhXNJ60Tnw6jn/QpZvztLD
8kUfRiU+DbWbtAyZaRXcyAZBiMRVP7fqSL6EJMFTadOA25eES1Mv+cVEln4F6/vT
eENlLaQIoIxokckGCa/BUj5r+sHJW/kY5/O1X7cCgYEA9aV9NJRHX/Ymnp8DkGEM
fXpLP/AklnGXAhp7qXsDsdm2hRtUS0V8N52n2QtSx8uuhhQtpNPE3i1dg8FHMYzO
Z38VyCmh7muBjJ5XE1oqrz9vATx81M1JZHZJqOsej+TAnS4ZDL9ECxNOl+/kSea1
nIVJn5faNuqtlsw0UCpV9NECgYAJ4zOYvgEVi7aKSZ9tINiYu157eq/u3Qfz603i
HLBe7scXmtaDXxlZE0P89/m5sqVNoURN5S3/xmlY7u/eVWN1FCn1fRjqaz8YIvyg
oAdtGjaRg2O5w4pkSU7lmv9t4jJecl6Ufdn3zKs4a5O5PO4QBPLpq6bRii1Q5r1q
jPMfNwKBgQDtNHTgbCKVXcjWGgQHHvZiazdR8lSN2ELxbNEi+oCH5McL1XncWjLu
/RnzWOUrofjWgaKr9O8tO9UMGK7/zgnYZxXovbxCZN1wx2jEGa1Fllz0cGG8qu14
oq7Gd3JVHpIwM6Cz1LL8fK1JKlS0uSLvdzxYOJN6d5LpGBMQzfQ56g==
-----END RSA PRIVATE KEY-----
PS C:\Users\Shailesh> ls

    Directory: C:\Users\Shailesh

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
d----          23-10-2022    21:12                .azure
d----          09-09-2022    18:58                .docker
d----          24-10-2022    13:08                .kube
d----          01-09-2022    01:45                .minikube
d----          01-09-2022    01:45                .redhat
d----          01-09-2022    01:54                .ssh
d----          01-09-2022    01:35                .vs-kubernetes
d----          01-09-2022    01:27                .vscode
d-r--          31-08-2022    21:55                Contacts
d----          24-10-2022    13:10                Documents
d-r--          24-10-2022    13:32                Downloads
d-r--          31-08-2022    21:55                Favorites
d----          01-09-2022    01:03                getting-started
d-r--          31-08-2022    21:55                Links
d-r--          31-08-2022    21:55                Music
lar--          24-10-2022    13:10                OneDrive
d-r--          31-08-2022    21:55                Saved Games
d-r--          01-09-2022    00:21                Searches
d-r--          03-09-2022    17:16                Videos
-a---          09-09-2022    19:33       41958912 kubectl-convert.exe
-a---          09-09-2022    19:33             64 kubectl-convert.exe.sha256
-a---          24-10-2022    13:35           1679 mypubkey
-a---          24-10-2022    13:35            409 mypubkey.pub

PS C:\Users\Shailesh> cat .\mypubkey.pub
ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcORhzul2h0nLCUQw+3C4DSWGTwuVc5w8YwIL45nZ4pppErfzy+Twna1ZBoX2khBE0RpCbGtUZF5SkfPWP86aWQhTyFwyo4epjTCHf+pUitt/FAqW9rkvgXUR7OCZvT5SrAcubqISkCQyMqMjfbtZOHBcg0znh3SZ1z4w/fDZpqw5TELm2fMYjkG/ZBKV3qtxbBKdlc+hxcrP8jYIvidiRh7fcxmhnP0tuaG4nVJ4RNy9lNuX4HY0u/TQk852izjTfhJXrKWITStrLXCkwnXOU/VF/LYPKAcZnKjyYnqCZWrgixbv8MHzm0hfxNVp6u2Ra1rJ3CGaORp1VMEcUrhdD shailesh@MyCloudPlayGround
PS C:\Users\Shailesh>


PS C:\Users\Shailesh\.kube>  az aks get-credentials --name k8stest --resource-group rg-patient-mudfish
Merged "k8stest" as current context in C:\Users\Shailesh\.kube\config
PS C:\Users\Shailesh\.kube> kubectl get nodes
NAME                                STATUS   ROLES   AGE   VERSION
aks-agentpool-87238662-vmss000000   Ready    agent   13m   v1.23.12
aks-agentpool-87238662-vmss000001   Ready    agent   13m   v1.23.12
aks-agentpool-87238662-vmss000002   Ready    agent   13m   v1.23.12
PS C:\Users\Shailesh\.kube>



PS D:\CloudPlayGround\explore-azure\terraform\aks cluster> terraform plan -destroy -out main.destroy.tfplan
random_pet.rg_name: Refreshing state... [id=rg-patient-mudfish]
random_id.log_analytics_workspace_name_suffix: Refreshing state... [id=5EWLxCaxykc]
azurerm_resource_group.rg: Refreshing state... [id=/subscriptions/556a8191-80bf-4752-b4de-c25ad263abf2/resourceGroups/rg-patient-mudfish]
azurerm_log_analytics_workspace.test: Refreshing state... [id=/subscriptions/556a8191-80bf-4752-b4de-c25ad263abf2/resourceGroups/rg-patient-mudfish/providers/Microsoft.OperationalInsights/workspaces/testLogAnalyticsWorkspaceName-16448706888619641415]
azurerm_kubernetes_cluster.k8s: Refreshing state... [id=/subscriptions/556a8191-80bf-4752-b4de-c25ad263abf2/resourceGroups/rg-patient-mudfish/providers/Microsoft.ContainerService/managedClusters/k8stest]
azurerm_log_analytics_solution.test: Refreshing state... [id=/subscriptions/556a8191-80bf-4752-b4de-c25ad263abf2/resourceGroups/rg-patient-mudfish/providers/Microsoft.OperationsManagement/solutions/ContainerInsights(testLogAnalyticsWorkspaceName-16448706888619641415)]

Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
  - destroy

Terraform will perform the following actions:

  # azurerm_kubernetes_cluster.k8s will be destroyed
  - resource "azurerm_kubernetes_cluster" "k8s" {
      - api_server_authorized_ip_ranges     = [] -> null
      - azure_policy_enabled                = false -> null
      - dns_prefix                          = "k8stest" -> null
      - enable_pod_security_policy          = false -> null
      - fqdn                                = "k8stest-23cbb405.hcp.eastus.azmk8s.io" -> null
      - http_application_routing_enabled    = false -> null
      - id                                  = "/subscriptions/556a8191-80bf-4752-b4de-c25ad263abf2/resourceGroups/rg-patient-mudfish/providers/Microsoft.ContainerService/managedClusters/k8stest" -> null
      - kube_admin_config                   = (sensitive value)
      - kube_config                         = (sensitive value)
      - kube_config_raw                     = (sensitive value)
      - kubernetes_version                  = "1.23.12" -> null
      - local_account_disabled              = false -> null
      - location                            = "eastus" -> null
      - name                                = "k8stest" -> null
      - node_resource_group                 = "MC_rg-patient-mudfish_k8stest_eastus" -> null
      - oidc_issuer_enabled                 = false -> null
      - open_service_mesh_enabled           = false -> null
      - portal_fqdn                         = "k8stest-23cbb405.portal.hcp.eastus.azmk8s.io" -> null
      - private_cluster_enabled             = false -> null
      - private_cluster_public_fqdn_enabled = false -> null
      - public_network_access_enabled       = true -> null
      - resource_group_name                 = "rg-patient-mudfish" -> null
      - role_based_access_control_enabled   = true -> null
      - run_command_enabled                 = true -> null
      - sku_tier                            = "Free" -> null
      - tags                                = {
          - "Environment" = "Development"
        } -> null
      - workload_identity_enabled           = false -> null

      - default_node_pool {
          - enable_auto_scaling          = false -> null
          - enable_host_encryption       = false -> null
          - enable_node_public_ip        = false -> null
          - fips_enabled                 = false -> null
          - kubelet_disk_type            = "OS" -> null
          - max_count                    = 0 -> null
          - max_pods                     = 110 -> null
          - min_count                    = 0 -> null
          - name                         = "agentpool" -> null
          - node_count                   = 3 -> null
          - node_labels                  = {} -> null
          - node_taints                  = [] -> null
          - only_critical_addons_enabled = false -> null
          - orchestrator_version         = "1.23.12" -> null
          - os_disk_size_gb              = 128 -> null
          - os_disk_type                 = "Managed" -> null
          - os_sku                       = "Ubuntu" -> null
          - scale_down_mode              = "Delete" -> null
          - tags                         = {} -> null
          - type                         = "VirtualMachineScaleSets" -> null
          - ultra_ssd_enabled            = false -> null
          - vm_size                      = "Standard_D2_v2" -> null
          - zones                        = [] -> null
        }

      - linux_profile {
          - admin_username = "ubuntu" -> null

          - ssh_key {
              - key_data = <<-EOT
                    ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcORhzul2h0nLCUQw+3C4DSWGTwuVc5w8YwIL45nZ4pppErfzy+Twna1ZBoX2khBE0RpCbGtUZF5SkfPWP86aWQhTyFwyo4epjTCHf+pUitt/FAqW9rkvgXUR7OCZvT5SrAcubqISkCQyMqMjfbtZOHBcg0znh3SZ1z4w/fDZpqw5TELm2fMYjkG/ZBKV3qtxbBKdlc+hxcrP8jYIvidiRh7fcxmhnP0tuaG4nVJ4RNy9lNuX4HY0u/TQk852izjTfhJXrKWITStrLXCkwnXOU/VF/LYPKAcZnKjyYnqCZWrgixbv8MHzm0hfxNVp6u2Ra1rJ3CGaORp1VMEcUrhdD shailesh@MyCloudPlayGround
                EOT -> null
            }
        }

      - network_profile {
          - dns_service_ip     = "10.0.0.10" -> null
          - docker_bridge_cidr = "172.17.0.1/16" -> null
          - ip_versions        = [
              - "IPv4",
            ] -> null
          - load_balancer_sku  = "standard" -> null
          - network_plugin     = "kubenet" -> null
          - outbound_type      = "loadBalancer" -> null
          - pod_cidr           = "10.244.0.0/16" -> null
          - pod_cidrs          = [
              - "10.244.0.0/16",
            ] -> null
          - service_cidr       = "10.0.0.0/16" -> null
          - service_cidrs      = [
              - "10.0.0.0/16",
            ] -> null

          - load_balancer_profile {
              - effective_outbound_ips      = [
                  - "/subscriptions/556a8191-80bf-4752-b4de-c25ad263abf2/resourceGroups/MC_rg-patient-mudfish_k8stest_eastus/providers/Microsoft.Network/publicIPAddresses/8059495a-67d2-43f0-bbf5-faa7d9b31070",
                ] -> null
              - idle_timeout_in_minutes     = 0 -> null
              - managed_outbound_ip_count   = 1 -> null
              - managed_outbound_ipv6_count = 0 -> null
              - outbound_ip_address_ids     = [] -> null
              - outbound_ip_prefix_ids      = [] -> null
              - outbound_ports_allocated    = 0 -> null
            }
        }

      - service_principal {
          - client_id     = "d6adfb30-53e3-4719-aba8-7ebff0416131" -> null
          - client_secret = (sensitive value)
        }
    }

  # azurerm_log_analytics_solution.test will be destroyed
  - resource "azurerm_log_analytics_solution" "test" {
      - id                    = "/subscriptions/556a8191-80bf-4752-b4de-c25ad263abf2/resourceGroups/rg-patient-mudfish/providers/Microsoft.OperationsManagement/solutions/ContainerInsights(testLogAnalyticsWorkspaceName-16448706888619641415)" -> null
      - location              = "eastus" -> null
      - resource_group_name   = "rg-patient-mudfish" -> null
      - solution_name         = "ContainerInsights" -> null
      - tags                  = {} -> null
      - workspace_name        = "testLogAnalyticsWorkspaceName-16448706888619641415" -> null
      - workspace_resource_id = "/subscriptions/556a8191-80bf-4752-b4de-c25ad263abf2/resourceGroups/rg-patient-mudfish/providers/Microsoft.OperationalInsights/workspaces/testLogAnalyticsWorkspaceName-16448706888619641415" -> null

      - plan {
          - name      = "ContainerInsights(testLogAnalyticsWorkspaceName-16448706888619641415)" -> null
          - product   = "OMSGallery/ContainerInsights" -> null
          - publisher = "Microsoft" -> null
        }
    }

  # azurerm_log_analytics_workspace.test will be destroyed
  - resource "azurerm_log_analytics_workspace" "test" {
      - cmk_for_query_forced       = false -> null
      - daily_quota_gb             = -1 -> null
      - id                         = "/subscriptions/556a8191-80bf-4752-b4de-c25ad263abf2/resourceGroups/rg-patient-mudfish/providers/Microsoft.OperationalInsights/workspaces/testLogAnalyticsWorkspaceName-16448706888619641415" -> null
      - internet_ingestion_enabled = true -> null
      - internet_query_enabled     = true -> null
      - location                   = "eastus" -> null
      - name                       = "testLogAnalyticsWorkspaceName-16448706888619641415" -> null
      - primary_shared_key         = (sensitive value)
      - resource_group_name        = "rg-patient-mudfish" -> null
      - retention_in_days          = 30 -> null
      - secondary_shared_key       = (sensitive value)
      - sku                        = "PerGB2018" -> null
      - tags                       = {} -> null
      - workspace_id               = "0c9e25df-4f10-448b-a528-73a81af08d23" -> null
    }

  # azurerm_resource_group.rg will be destroyed
  - resource "azurerm_resource_group" "rg" {
      - id       = "/subscriptions/556a8191-80bf-4752-b4de-c25ad263abf2/resourceGroups/rg-patient-mudfish" -> null
      - location = "eastus" -> null
      - name     = "rg-patient-mudfish" -> null
      - tags     = {} -> null
    }

  # random_id.log_analytics_workspace_name_suffix will be destroyed
  - resource "random_id" "log_analytics_workspace_name_suffix" {
      - b64_std     = "5EWLxCaxykc=" -> null
      - b64_url     = "5EWLxCaxykc" -> null
      - byte_length = 8 -> null
      - dec         = "16448706888619641415" -> null
      - hex         = "e4458bc426b1ca47" -> null
      - id          = "5EWLxCaxykc" -> null
    }

  # random_pet.rg_name will be destroyed
  - resource "random_pet" "rg_name" {
      - id        = "rg-patient-mudfish" -> null
      - length    = 2 -> null
      - prefix    = "rg" -> null
      - separator = "-" -> null
    }

Plan: 0 to add, 0 to change, 6 to destroy.

Changes to Outputs:
  - client_certificate     = (sensitive value)
  - client_key             = (sensitive value)
  - cluster_ca_certificate = (sensitive value)
  - cluster_password       = (sensitive value)
  - cluster_username       = (sensitive value)
  - host                   = (sensitive value)
  - kube_config            = (sensitive value)
  - resource_group_name    = "rg-patient-mudfish" -> null

──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

Saved the plan to: main.destroy.tfplan

To perform exactly these actions, run the following command to apply:
    terraform apply "main.destroy.tfplan"
PS D:\CloudPlayGround\explore-azure\terraform\aks cluster> terraform apply main.destroy.tfplan
azurerm_log_analytics_solution.test: Destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-c25ad263abf2/resourceGroups/rg-patient-mudfish/providers/Microsoft.OperationsManagement/solutions/ContainerInsights(testLogAnalyticsWorkspaceName-16448706888619641415)]
azurerm_kubernetes_cluster.k8s: Destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-c25ad263abf2/resourceGroups/rg-patient-mudfish/providers/Microsoft.ContainerService/managedClusters/k8stest]
azurerm_log_analytics_solution.test: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...icsWorkspaceName-16448706888619641415), 10s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 10s elapsed]
azurerm_log_analytics_solution.test: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...icsWorkspaceName-16448706888619641415), 20s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 20s elapsed]
azurerm_log_analytics_solution.test: Destruction complete after 30s
azurerm_log_analytics_workspace.test: Destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-c25ad263abf2/resourceGroups/rg-patient-mudfish/providers/Microsoft.OperationalInsights/workspaces/testLogAnalyticsWorkspaceName-16448706888619641415]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 30s elapsed]
azurerm_log_analytics_workspace.test: Destruction complete after 9s
random_id.log_analytics_workspace_name_suffix: Destroying... [id=5EWLxCaxykc]
random_id.log_analytics_workspace_name_suffix: Destruction complete after 0s
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 40s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 50s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 1m0s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 1m10s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 1m20s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 1m30s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 1m40s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 1m50s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 2m0s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 2m10s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 2m20s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 2m30s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 2m40s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 2m50s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 3m0s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 3m10s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 3m20s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 3m30s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 3m40s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 3m50s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 4m0s elapsed]
azurerm_kubernetes_cluster.k8s: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...ntainerService/managedClusters/k8stest, 4m10s elapsed]
azurerm_kubernetes_cluster.k8s: Destruction complete after 4m11s
azurerm_resource_group.rg: Destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-c25ad263abf2/resourceGroups/rg-patient-mudfish]
azurerm_resource_group.rg: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...abf2/resourceGroups/rg-patient-mudfish, 10s elapsed]
azurerm_resource_group.rg: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...abf2/resourceGroups/rg-patient-mudfish, 20s elapsed]
azurerm_resource_group.rg: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...abf2/resourceGroups/rg-patient-mudfish, 30s elapsed]
azurerm_resource_group.rg: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...abf2/resourceGroups/rg-patient-mudfish, 40s elapsed]
azurerm_resource_group.rg: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...abf2/resourceGroups/rg-patient-mudfish, 51s elapsed]
azurerm_resource_group.rg: Still destroying... [id=/subscriptions/556a8191-80bf-4752-b4de-...abf2/resourceGroups/rg-patient-mudfish, 1m1s elapsed]
azurerm_resource_group.rg: Destruction complete after 1m10s
random_pet.rg_name: Destroying... [id=rg-patient-mudfish]
random_pet.rg_name: Destruction complete after 0s

Apply complete! Resources: 0 added, 0 changed, 6 destroyed.
PS D:\CloudPlayGround\explore-azure\terraform\aks cluster>




PS D:\CloudPlayGround\explore-azure\docker\prod> ls

    Directory: D:\CloudPlayGround\explore-azure\docker\prod

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---          01-09-2022    02:08            419 firstapp.yaml
-a---          01-09-2022    02:08            225 firstappservice.yaml

PS D:\CloudPlayGround\explore-azure\docker\prod> cd ..
PS D:\CloudPlayGround\explore-azure\docker> cd ..
PS D:\CloudPlayGround\explore-azure> cd .\firstapp\
PS D:\CloudPlayGround\explore-azure\firstapp> ls

    Directory: D:\CloudPlayGround\explore-azure\firstapp

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
-a---          01-09-2022    02:08            141 Dockerfile
-a---          01-09-2022    02:08            204 firstapp.py
-a---          01-09-2022    02:08            237 test_firstapp.py

PS D:\CloudPlayGround\explore-azure\firstapp> az acr build --image first-app:v1 --registry shaaksacr --file Dockerfile .
Packing source code into tar to upload...
Uploading archived source code from 'C:\Users\Shailesh\AppData\Local\Temp\build_archive_8cc2c464ef864dc9b51b961eae4b0e52.tar.gz'...
Sending context (729.000 Bytes) to registry: shaaksacr...
Queued a build with ID: ca1
Waiting for an agent...
2022/10/25 18:23:02 Downloading source code...
2022/10/25 18:23:03 Finished downloading source code
2022/10/25 18:23:03 Using acb_vol_7da773ef-c355-4120-a5ff-4df5cb820c3c as the home volume
2022/10/25 18:23:03 Setting up Docker configuration...
2022/10/25 18:23:04 Successfully set up Docker configuration
2022/10/25 18:23:04 Logging in to registry: shaaksacr.azurecr.io
2022/10/25 18:23:05 Successfully logged into shaaksacr.azurecr.io
2022/10/25 18:23:05 Executing step ID: build. Timeout(sec): 28800, Working directory: '', Network: ''
2022/10/25 18:23:05 Scanning for dependencies...
2022/10/25 18:23:05 Successfully scanned dependencies
2022/10/25 18:23:05 Launching container with name: build
Sending build context to Docker daemon   5.12kB
Step 1/6 : FROM python:3.7-slim
3.7-slim: Pulling from library/python
e9995326b091: Pulling fs layer
f3d7f077cdde: Pulling fs layer
ffc9c06e5974: Pulling fs layer
8dfa28e49d8f: Pulling fs layer
fa6edf997d16: Pulling fs layer
8dfa28e49d8f: Waiting
fa6edf997d16: Waiting
f3d7f077cdde: Verifying Checksum
f3d7f077cdde: Download complete
8dfa28e49d8f: Verifying Checksum
8dfa28e49d8f: Download complete
ffc9c06e5974: Verifying Checksum
ffc9c06e5974: Download complete
fa6edf997d16: Verifying Checksum
fa6edf997d16: Download complete
e9995326b091: Verifying Checksum
e9995326b091: Download complete
e9995326b091: Pull complete
f3d7f077cdde: Pull complete
ffc9c06e5974: Pull complete
8dfa28e49d8f: Pull complete
fa6edf997d16: Pull complete
Digest: sha256:06f607663cf76d32a82dba1623274e18a98c4a3484fe9105d20392142ca0fc5e
Status: Downloaded newer image for python:3.7-slim
 ---> 68f77bc1394d
Step 2/6 : RUN pip install flask
 ---> Running in c8c9a7b3bbec
Collecting flask
  Downloading Flask-2.2.2-py3-none-any.whl (101 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 101.5/101.5 KB 16.3 MB/s eta 0:00:00
Collecting Werkzeug>=2.2.2
  Downloading Werkzeug-2.2.2-py3-none-any.whl (232 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 232.7/232.7 KB 37.1 MB/s eta 0:00:00
Collecting itsdangerous>=2.0
  Downloading itsdangerous-2.1.2-py3-none-any.whl (15 kB)
Collecting Jinja2>=3.0
  Downloading Jinja2-3.1.2-py3-none-any.whl (133 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 133.1/133.1 KB 22.3 MB/s eta 0:00:00
Collecting click>=8.0
  Downloading click-8.1.3-py3-none-any.whl (96 kB)
     ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 96.6/96.6 KB 13.0 MB/s eta 0:00:00
Collecting importlib-metadata>=3.6.0
  Downloading importlib_metadata-5.0.0-py3-none-any.whl (21 kB)
Collecting typing-extensions>=3.6.4
  Downloading typing_extensions-4.4.0-py3-none-any.whl (26 kB)
Collecting zipp>=0.5
  Downloading zipp-3.10.0-py3-none-any.whl (6.2 kB)
Collecting MarkupSafe>=2.0
  Downloading MarkupSafe-2.1.1-cp37-cp37m-manylinux_2_17_x86_64.manylinux2014_x86_64.whl (25 kB)
Installing collected packages: zipp, typing-extensions, MarkupSafe, itsdangerous, Werkzeug, Jinja2, importlib-metadata, click, flask
Successfully installed Jinja2-3.1.2 MarkupSafe-2.1.1 Werkzeug-2.2.2 click-8.1.3 flask-2.2.2 importlib-metadata-5.0.0 itsdangerous-2.1.2 typing-extensions-4.4.0 zipp-3.10.0
WARNING: Running pip as the 'root' user can result in broken permissions and conflicting behaviour with the system package manager. It is recommended to use a virtual environment instead: https://pip.pypa.io/warnings/venv
WARNING: You are using pip version 22.0.4; however, version 22.3 is available.
You should consider upgrading via the '/usr/local/bin/python -m pip install --upgrade pip' command.
Removing intermediate container c8c9a7b3bbec
 ---> 5e0c178cd728
Step 3/6 : WORKDIR /app
 ---> Running in 88cc2b67d083
Removing intermediate container 88cc2b67d083
 ---> 66fee7e02e97
Step 4/6 : COPY firstapp.py /app/firstapp.py
 ---> 69a497de0089
Step 5/6 : ENTRYPOINT ["python"]
 ---> Running in 341c03a6b5a8
Removing intermediate container 341c03a6b5a8
 ---> f5a6a956218a
Step 6/6 : CMD ["/app/firstapp.py"]
 ---> Running in 6732739465b1
Removing intermediate container 6732739465b1
 ---> 62c6c5137360
Successfully built 62c6c5137360
Successfully tagged shaaksacr.azurecr.io/first-app:v1
2022/10/25 18:23:18 Successfully executed container: build
2022/10/25 18:23:18 Executing step ID: push. Timeout(sec): 3600, Working directory: '', Network: ''
2022/10/25 18:23:18 Pushing image: shaaksacr.azurecr.io/first-app:v1, attempt 1
The push refers to repository [shaaksacr.azurecr.io/first-app]
3ab17e726f3d: Preparing
3b935862a2d6: Preparing
fe1db2bfc866: Preparing
6a5b366b3eba: Preparing
81e1d1c3f2da: Preparing
07d8a5dffa2a: Preparing
5772b8372e59: Preparing
a12586ed027f: Preparing
5772b8372e59: Waiting
a12586ed027f: Waiting
07d8a5dffa2a: Waiting
3b935862a2d6: Pushed
3ab17e726f3d: Pushed
81e1d1c3f2da: Pushed
6a5b366b3eba: Pushed
fe1db2bfc866: Pushed
5772b8372e59: Pushed
07d8a5dffa2a: Pushed
a12586ed027f: Pushed
v1: digest: sha256:cb9cc5f93366bcaeedf1d9eeb08852b7547c8522051a3cc6dbae0b30b095879b size: 1994
2022/10/25 18:23:28 Successfully pushed image: shaaksacr.azurecr.io/first-app:v1
2022/10/25 18:23:28 Step ID: build marked as successful (elapsed time in seconds: 13.056854)
2022/10/25 18:23:28 Populating digests for step ID: build...
2022/10/25 18:23:29 Successfully populated digests for step ID: build
2022/10/25 18:23:29 Step ID: push marked as successful (elapsed time in seconds: 9.896728)
2022/10/25 18:23:29 The following dependencies were found:
2022/10/25 18:23:29
- image:
    registry: shaaksacr.azurecr.io
    repository: first-app
    tag: v1
    digest: sha256:cb9cc5f93366bcaeedf1d9eeb08852b7547c8522051a3cc6dbae0b30b095879b
  runtime-dependency:
    registry: registry.hub.docker.com
    repository: library/python
    tag: 3.7-slim
    digest: sha256:06f607663cf76d32a82dba1623274e18a98c4a3484fe9105d20392142ca0fc5e
  git: {}

Run ID: ca1 was successful after 27s
PS D:\CloudPlayGround\explore-azure\firstapp>


PS D:\CloudPlayGround\explore-azure\firstapp> kubectl create namespace ingress-basic
namespace/ingress-basic created
PS D:\CloudPlayGround\explore-azure\firstapp> kubectl get all
NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
service/kubernetes   ClusterIP   10.0.0.1     <none>        443/TCP   33m
PS D:\CloudPlayGround\explore-azure\firstapp> helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
"ingress-nginx" has been added to your repositories
PS D:\CloudPlayGround\explore-azure\firstapp> helm repo update
Hang tight while we grab the latest from your chart repositories...
...Successfully got an update from the "ingress-nginx" chart repository
Update Complete. ⎈Happy Helming!⎈
PS D:\CloudPlayGround\explore-azure\firstapp> helm search repo ingress-nginx
NAME                            CHART VERSION   APP VERSION     DESCRIPTION
ingress-nginx/ingress-nginx     4.3.0           1.4.0           Ingress controller for Kubernetes using NGINX a...
PS D:\CloudPlayGround\explore-azure\firstapp> helm install ingress-nginx ingress-nginx/ingress-nginx --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-health-probe-request-path"=/healthz
NAME: ingress-nginx
LAST DEPLOYED: Tue Oct 25 23:59:05 2022
NAMESPACE: default
STATUS: deployed
REVISION: 1
TEST SUITE: None
NOTES:
The ingress-nginx controller has been installed.
It may take a few minutes for the LoadBalancer IP to be available.
You can watch the status by running 'kubectl --namespace default get services -o wide -w ingress-nginx-controller'

An example Ingress that makes use of the controller:
  apiVersion: networking.k8s.io/v1
  kind: Ingress
  metadata:
    name: example
    namespace: foo
  spec:
    ingressClassName: nginx
    rules:
      - host: www.example.com
        http:
          paths:
            - pathType: Prefix
              backend:
                service:
                  name: exampleService
                  port:
                    number: 80
              path: /
    # This section is only required if TLS is to be enabled for the Ingress
    tls:
      - hosts:
        - www.example.com
        secretName: example-tls

If TLS is enabled for the Ingress, a Secret containing the certificate and key must also be provided:

  apiVersion: v1
  kind: Secret
  metadata:
    name: example-tls
    namespace: foo
  data:
    tls.crt: <base64 encoded cert>
    tls.key: <base64 encoded key>
  type: kubernetes.io/tls
PS D:\CloudPlayGround\explore-azure\firstapp> helm list --namespace ingress-basic
NAME    NAMESPACE       REVISION        UPDATED STATUS  CHART   APP VERSION
PS D:\CloudPlayGround\explore-azure\firstapp>

PS D:\CloudPlayGround\explore-azure\firstapp> helm list --namespace ingress-basic
NAME    NAMESPACE       REVISION        UPDATED STATUS  CHART   APP VERSION
PS D:\CloudPlayGround\explore-azure\firstapp> kubectl --namespace ingress-basic get services -o wide -w nginx-ingress-ingress-nginx-controller
Error from server (NotFound): services "nginx-ingress-ingress-nginx-controller" not found
PS D:\CloudPlayGround\explore-azure\firstapp> kubectl --namespace ingress-basic get services -o wide -w ingress-nginx-controller
Error from server (NotFound): services "ingress-nginx-controller" not found
PS D:\CloudPlayGround\explore-azure\firstapp> kubectl --namespace default get services -o wide -w ingress-nginx-controller
NAME                       TYPE           CLUSTER-IP    EXTERNAL-IP     PORT(S)                      AGE     SELECTOR
ingress-nginx-controller   LoadBalancer   10.0.230.51   20.119.127.44   80:31707/TCP,443:30601/TCP   4m51s   app.kubernetes.io/component=controller,app.kubernetes.io/instance=ingress-nginx,app.kubernetes.io/name=ingress-nginx
PS D:\CloudPlayGround\explore-azure\firstapp>
PS D:\CloudPlayGround\explore-azure\firstapp>
PS D:\CloudPlayGround\explore-azure\firstapp> helm uninstall --namespace default nginx-ingress
Error: uninstall: Release not loaded: nginx-ingress: release: not found
PS D:\CloudPlayGround\explore-azure\firstapp> helm uninstall --namespace default ingress-nginx-controller
Error: uninstall: Release not loaded: ingress-nginx-controller: release: not found
PS D:\CloudPlayGround\explore-azure\firstapp> helm uninstall --namespace default ingress-nginx
release "ingress-nginx" uninstalled
PS D:\CloudPlayGround\explore-azure\firstapp> helm install ingress-nginx ingress-nginx/ingress-nginx --namespace ingress-basic --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-health-probe-request-path"=/healthz
