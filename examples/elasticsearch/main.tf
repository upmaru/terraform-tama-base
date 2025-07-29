provider "tama" {
  base_url = var.tama_base_url
  api_key  = var.tama_api_key
}

module "global" {
  source = "../../"
}

module "elasticsearch" {
  source = "../../modules/elasticsearch"

  name           = "elasticsearch"
  schema_version = "1.0.0"
  endpoint       = "https://elasticsearch.arrakis.upmaru.network"
  api_key        = var.elasticsearch_api_key
}
