data "tama_space" "global" {
  id = "global"
}

provider "tama" {
  base_url = var.tama_base_url
  api_key  = var.tama_api_key
}

variable "xai_api_key" {}
module "xai" {
  source = "../../modules/inference-service"

  space_id = data.tama_space.global.id
  api_key  = var.xai_api_key
  endpoint = "https://api.x.ai/v1"
  name     = "xai"

  requests_per_second = 4

  models = [
    {
      identifier = "grok-3-mini"
      path       = "/chat/completions"
      parameters = {
        reasoning_effort = "high"
      }
    },
    {
      identifier = "grok-3-mini-fast"
      path       = "/chat/completions"
      parameters = {
        reasoning_effort = "low"
      }
    }
  ]
}
