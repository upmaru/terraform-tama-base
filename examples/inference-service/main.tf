provider "tama" {
  base_url = var.tama_base_url
  api_key  = var.tama_api_key
}

module "global" {
  source = "../../"
}

variable "xai_api_key" {}
module "xai" {
  source = "../../modules/inference-service"

  space_id = module.global.space.id
  api_key  = var.xai_api_key
  endpoint = "https://api.x.ai/v1"
  name     = "xai"

  requests_per_second = 4

  models = [
    {
      identifier = "grok-3-mini"
      path       = "/chat/completions"
      parameters = jsonencode({
        reasoning_effort = "high"
      })
    },
    {
      identifier = "grok-3-mini-fast"
      path       = "/chat/completions"
      parameters = jsonencode({
        reasoning_effort = "low"
      })
    },
    {
      identifier = "grok-4"
      path       = "/chat/completions"
    }
  ]
}

resource "tama_space_processor" "completion" {
  space_id = module.global.space.id
  model_id = module.xai.model_ids["grok-3-mini"]

  completion_config {
    temperature = 0.5
    tool_choice = "required"
  }
}
