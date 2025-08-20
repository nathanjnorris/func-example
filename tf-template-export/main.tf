terraform {
  required_providers {
    azurerm = {
      source  = "azurerm"
      version = "4.33.0"
    }
  }
}
provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "res-0" {
  location   = "australiaeast"
  managed_by = ""
  name       = "rg-examplefunc"
  tags       = {}
}
resource "azurerm_user_assigned_identity" "res-1" {
  location            = "australiaeast"
  name                = "examplefunc-id-a46d"
  resource_group_name = "rg-examplefunc"
  tags                = {}
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_federated_identity_credential" "res-2" {
  audience            = ["api://AzureADTokenExchange"]
  issuer              = "https://token.actions.githubusercontent.com"
  name                = "tiabroqqp677a"
  parent_id           = azurerm_user_assigned_identity.res-1.id
  resource_group_name = "rg-examplefunc"
  subject             = "repo:nathanjnorris/func-example:ref:refs/heads/main"
}
resource "azurerm_user_assigned_identity" "res-3" {
  location            = "australiaeast"
  name                = "examplefunc-uami"
  resource_group_name = "rg-examplefunc"
  tags                = {}
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_storage_account" "res-4" {
  access_tier                       = "Hot"
  account_kind                      = "StorageV2"
  account_replication_type          = "LRS"
  account_tier                      = "Standard"
  allow_nested_items_to_be_public   = false
  allowed_copy_scope                = ""
  cross_tenant_replication_enabled  = false
  default_to_oauth_authentication   = true
  dns_endpoint_type                 = "Standard"
  edge_zone                         = ""
  https_traffic_only_enabled        = true
  infrastructure_encryption_enabled = false
  is_hns_enabled                    = false
  large_file_share_enabled          = false
  local_user_enabled                = true
  location                          = "australiaeast"
  min_tls_version                   = "TLS1_2"
  name                              = "stexamplefunc"
  nfsv3_enabled                     = false
  primary_access_key                = "" # Masked sensitive attribute
  primary_blob_connection_string    = "" # Masked sensitive attribute
  primary_connection_string         = "" # Masked sensitive attribute
  public_network_access_enabled     = true
  queue_encryption_key_type         = "Service"
  resource_group_name               = "rg-examplefunc"
  secondary_access_key              = "" # Masked sensitive attribute
  secondary_blob_connection_string  = "" # Masked sensitive attribute
  secondary_connection_string       = "" # Masked sensitive attribute
  sftp_enabled                      = false
  shared_access_key_enabled         = false
  table_encryption_key_type         = "Service"
  tags                              = {}
  blob_properties {
    change_feed_enabled           = false
    change_feed_retention_in_days = 0
    default_service_version       = ""
    last_access_time_enabled      = false
    versioning_enabled            = false
  }
  share_properties {
    retention_policy {
      days = 7
    }
  }
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_storage_container" "res-6" {
  container_access_type             = "private"
  default_encryption_scope          = "$account-encryption-key"
  encryption_scope_override_enabled = true
  metadata                          = {}
  name                              = "app-package-examplefunc-87684dc"
  storage_account_id                = azurerm_storage_account.res-4.id
  storage_account_name              = ""
}
resource "azurerm_role_assignment" "res-7" {
  condition                              = ""
  condition_version                      = ""
  delegated_managed_identity_resource_id = ""
  description                            = ""
  name                                   = "2ff68c84-a881-5dfb-ad70-af3cbdd04541"
  principal_id                           = "64fabac6-129b-44bd-9b04-17756a7be921"
  principal_type                         = "ServicePrincipal"
  role_definition_id                     = "/subscriptions/432f2e9b-e36e-40b0-93f0-be3a9a69da6b/providers/Microsoft.Authorization/roleDefinitions/ba92f5b4-2d11-453d-a403-e96b0029c9fe"
  role_definition_name                   = "Storage Blob Data Contributor"
  scope                                  = "/subscriptions/432f2e9b-e36e-40b0-93f0-be3a9a69da6b/resourcegroups/rg-examplefunc/providers/Microsoft.Storage/storageAccounts/stexamplefunc/blobServices/default/containers/app-package-examplefunc-87684dc"
  depends_on = [
    azurerm_storage_container.res-6
  ]
}
resource "azurerm_storage_container" "res-8" {
  container_access_type             = "private"
  default_encryption_scope          = "$account-encryption-key"
  encryption_scope_override_enabled = true
  metadata                          = {}
  name                              = "azure-webjobs-hosts"
  storage_account_id                = azurerm_storage_account.res-4.id
  storage_account_name              = ""
}
resource "azurerm_storage_container" "res-9" {
  container_access_type             = "private"
  default_encryption_scope          = "$account-encryption-key"
  encryption_scope_override_enabled = true
  metadata                          = {}
  name                              = "azure-webjobs-secrets"
  storage_account_id                = azurerm_storage_account.res-4.id
  storage_account_name              = ""
}
resource "azurerm_role_assignment" "res-11" {
  condition                              = ""
  condition_version                      = ""
  delegated_managed_identity_resource_id = ""
  description                            = ""
  name                                   = "d7542dc0-0069-5c61-a2e0-336530751c57"
  principal_id                           = "64fabac6-129b-44bd-9b04-17756a7be921"
  principal_type                         = "ServicePrincipal"
  role_definition_id                     = "/subscriptions/432f2e9b-e36e-40b0-93f0-be3a9a69da6b/providers/Microsoft.Authorization/roleDefinitions/b7e6dc6d-f1e8-4753-8033-0f276bb0955b"
  role_definition_name                   = "Storage Blob Data Owner"
  scope                                  = "/subscriptions/432f2e9b-e36e-40b0-93f0-be3a9a69da6b/resourcegroups/rg-examplefunc/providers/Microsoft.Storage/storageAccounts/stexamplefunc"
  depends_on = [
    azurerm_storage_account.res-4
  ]
}
resource "azurerm_service_plan" "res-14" {
  app_service_environment_id      = ""
  location                        = "australiaeast"
  maximum_elastic_worker_count    = 1
  name                            = "ASP-rgexamplefunc-b1e9"
  os_type                         = "Linux"
  per_site_scaling_enabled        = false
  premium_plan_auto_scale_enabled = false
  resource_group_name             = "rg-examplefunc"
  sku_name                        = "FC1"
  tags                            = {}
  worker_count                    = 0
  zone_balancing_enabled          = false
  depends_on = [
    azurerm_resource_group.res-0
  ]
}
resource "azurerm_linux_function_app" "res-15" {
  app_settings                                   = {}
  builtin_logging_enabled                        = false
  client_certificate_enabled                     = false
  client_certificate_exclusion_paths             = ""
  client_certificate_mode                        = "Required"
  content_share_force_disabled                   = false
  custom_domain_verification_id                  = "" # Masked sensitive attribute
  daily_memory_time_quota                        = 0
  enabled                                        = true
  ftp_publish_basic_authentication_enabled       = false
  functions_extension_version                    = ""
  https_only                                     = true
  key_vault_reference_identity_id                = "SystemAssigned"
  location                                       = "australiaeast"
  name                                           = "examplefunc"
  public_network_access_enabled                  = true
  resource_group_name                            = "rg-examplefunc"
  service_plan_id                                = azurerm_service_plan.res-14.id
  site_credential                                = [] # Masked sensitive attribute
  storage_account_access_key                     = "" # Masked sensitive attribute
  storage_account_name                           = ""
  storage_key_vault_secret_id                    = ""
  storage_uses_managed_identity                  = false
  tags                                           = {}
  virtual_network_backup_restore_enabled         = false
  virtual_network_subnet_id                      = ""
  vnet_image_pull_enabled                        = false
  webdeploy_publish_basic_authentication_enabled = false
  zip_deploy_file                                = ""
  identity {
    identity_ids = [azurerm_user_assigned_identity.res-3.id]
    type         = "UserAssigned"
  }
  site_config {
    always_on                                     = false
    api_definition_url                            = ""
    api_management_api_id                         = ""
    app_command_line                              = ""
    app_scale_limit                               = 100
    application_insights_connection_string        = "" # Masked sensitive attribute
    application_insights_key                      = "" # Masked sensitive attribute
    container_registry_managed_identity_client_id = ""
    container_registry_use_managed_identity       = false
    default_documents                             = ["Default.htm", "Default.html", "Default.asp", "index.htm", "index.html", "iisstart.htm", "default.aspx", "index.php"]
    elastic_instance_minimum                      = 0
    ftps_state                                    = "FtpsOnly"
    health_check_eviction_time_in_min             = 0
    health_check_path                             = ""
    http2_enabled                                 = false
    ip_restriction_default_action                 = ""
    load_balancing_mode                           = "LeastRequests"
    managed_pipeline_mode                         = "Integrated"
    minimum_tls_version                           = "1.2"
    pre_warmed_instance_count                     = 0
    remote_debugging_enabled                      = false
    remote_debugging_version                      = ""
    runtime_scale_monitoring_enabled              = false
    scm_ip_restriction_default_action             = ""
    scm_minimum_tls_version                       = "1.2"
    scm_use_main_ip_restriction                   = false
    use_32_bit_worker                             = false
    vnet_route_all_enabled                        = false
    websockets_enabled                            = false
    worker_count                                  = 1
    cors {
      allowed_origins     = ["https://portal.azure.com"]
      support_credentials = false
    }
  }
}
resource "azurerm_function_app_function" "res-19" {
  config_json = jsonencode({
    bindings = [{
      authLevel = "function"
      direction = "in"
      methods   = ["get", "post"]
      name      = "Request"
      type      = "httpTrigger"
      }, {
      direction = "out"
      name      = "Response"
      type      = "http"
    }]
  })
  enabled         = true
  function_app_id = azurerm_linux_function_app.res-15.id
  language        = ""
  name            = "HttpTrigger1"
  test_data       = ""
}
resource "azurerm_function_app_function" "res-20" {
  config_json = jsonencode({
    bindings = [{
      direction = "in"
      name      = "Timer"
      schedule  = "0 */5 * * * *"
      type      = "timerTrigger"
    }]
  })
  enabled         = true
  function_app_id = azurerm_linux_function_app.res-15.id
  language        = ""
  name            = "TimerTrigger1"
  test_data       = ""
}
resource "azurerm_app_service_custom_hostname_binding" "res-21" {
  app_service_name    = "examplefunc"
  hostname            = "examplefunc-f9bpekcbhdgeagh5.australiaeast-01.azurewebsites.net"
  resource_group_name = "rg-examplefunc"
  ssl_state           = ""
  thumbprint          = ""
  depends_on = [
    azurerm_linux_function_app.res-15
  ]
}
resource "azurerm_role_assignment" "res-22" {
  condition                              = ""
  condition_version                      = ""
  delegated_managed_identity_resource_id = ""
  description                            = ""
  name                                   = "c78e787e-5806-57de-88d1-e7294affc886"
  principal_id                           = "f2df9d3c-efff-4adf-9dd3-904a355334ca"
  principal_type                         = "ServicePrincipal"
  role_definition_id                     = "/subscriptions/432f2e9b-e36e-40b0-93f0-be3a9a69da6b/providers/Microsoft.Authorization/roleDefinitions/de139f84-1756-47ae-9be6-808fbbe84772"
  role_definition_name                   = "Website Contributor"
  scope                                  = "/subscriptions/432f2e9b-e36e-40b0-93f0-be3a9a69da6b/resourcegroups/rg-examplefunc/providers/Microsoft.Web/sites/examplefunc"
  depends_on = [
    azurerm_linux_function_app.res-15
  ]
}
