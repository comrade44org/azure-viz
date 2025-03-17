resource "azurerm_resource_group" "rg-uks-csm-01" {
  name = "rg-uks-csm-01"
  location = "uksouth"
}

resource "random_integer" "randint" {
  min = 10000
  max = 99999
}

resource "azurerm_cosmosdb_account" "db" {
  name = "cdb-uks-viz-${random_integer.randint.result}"
  location = azurerm_resource_group.rg-uks-csm-01.location
  resource_group_name = azurerm_resource_group.rg-uks-csm-01.name
  offer_type = "Standard"
  kind = "GlobalDocumentDB"
  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }
  geo_location {
    location = "uksouth"
    failover_priority = 0
  }
}