provider "tama" {
  base_url = var.tama_base_url
  api_key  = var.tama_api_key
}

module "global" {
  source = "../../"
}

module "memovee" {
  source = "../../modules/messaging"

  name                 = "memovee"
  class_proxy_class_id = module.global.schemas["class-proxy"].id
}
