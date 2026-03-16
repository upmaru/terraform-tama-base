provider "tama" {
  base_url = var.tama_base_url
  api_key  = var.tama_api_key
}

module "exa" {
  source = "../../modules/exa"

  api_key = var.exa_api_key
}

output "specification_id" {
  value = module.exa.specification_id
}
