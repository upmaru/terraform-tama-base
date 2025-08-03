provider "tama" {
  base_url = var.tama_base_url
  api_key  = var.tama_api_key
}

module "global" {
  source = "../../"
}

module "memovee" {
  source     = "../../modules/messaging"
  depends_on = [module.global.schemas]

  name = "memovee"

  entity_network_class_id = module.global.schemas["entity-network"].id
}
