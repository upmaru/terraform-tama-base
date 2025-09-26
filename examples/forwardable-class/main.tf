provider "tama" {
  base_url = var.tama_base_url
  api_key  = var.tama_api_key
}

module "global" {
  source = "../../"
}

resource "tama_space" "example" {
  name = "Some Example Space 123"
  type = "root"
}

module "response" {
  source     = "../../modules/forwardable-class"
  depends_on = [module.global.schemas]

  space_id    = tama_space.example.id
  title       = "response"
  description = "The response class"
}
