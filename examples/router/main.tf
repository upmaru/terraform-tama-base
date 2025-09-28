provider "tama" {
  base_url = var.tama_base_url
  api_key  = var.tama_api_key
}

module "global" {
  source = "../../"
}

module "memovee" {
  source     = "../../modules/messaging"
  depends_on = [module.global]

  name = "memovee"
}

variable "openai_api_key" {}
module "openai" {
  source = "../../modules/inference-service"

  space_id = module.global.space.id
  api_key  = var.openai_api_key
  endpoint = "https://api.openai.com/v1"
  name     = "openai"

  requests_per_second = 4

  models = [
    {
      identifier = "gpt-5-mini"
      path       = "/chat/completions"
      parameters = jsonencode({
        reasoning_effort = "high"
        service_tier     = "flex"
      })
    }
  ]
}

module "router" {
  source = "../../modules/router"

  root_messaging_space_id = module.memovee.space_id

  message_routing_class_id = module.global.schemas["message-routing"].id

  routable_class_ids = [
    module.memovee.schemas["user-message"].id
  ]

  prompt = file("${path.module}/prompt.md")

  routing_model_id = module.openai.model_ids.gpt-5-mini
  routing_model_parameters = jsonencode({
    reasoning_effort = "minimal"
  })
}
