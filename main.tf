provider "azurerm"{
    features {}
}

module "aci-devops-agent" {
  source                  = "Azure/aci-devops-agent/azurerm"
  resource_group_name     = "rg-linux-devops-agents"
  location                = "westeurope"
  enable_vnet_integration = false
  create_resource_group   = true

  linux_agents_configuration = {
    agent_name_prefix = "linux-agent"
    agent_pool_name   = "self-host-pool"
    count             = 4,
    docker_image      = "jcorioland/aci-devops-agent"
    docker_tag        = "0.2-linux"
    cpu               = 1
    memory            = 4
  }
  /*
  windows_agents_configuration = {
    agent_name_prefix = "windows-agent"
    agent_pool_name   = "self-host-pool"
    count             = 1,
    docker_image      = "jcorioland/aci-devops-agent"
    docker_tag        = "0.2-win"
    cpu               = 1
    memory            = 4
  }*/
  azure_devops_org_name              = "natashavpc1"
  azure_devops_personal_access_token = "cyhvfht7cr5u5rgwszqkanhsndnh7w235t4r3fuwqks27wdw2j6q"

}