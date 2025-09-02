provider "tama" {
  base_url = var.tama_base_url
  api_key  = var.tama_api_key
}

module "global" {
  source = "../../"
}

resource "tama_space" "example" {
  name = "Example"
  type = "component"
}

resource "tama_specification" "personalization-spec" {
  space_id = tama_space.example.id
  endpoint = "/internal/personalization"
  version  = "1.0.0"

  schema = jsonencode(yamldecode(file("${path.module}/specification.yaml")))

  wait_for {
    field {
      name = "current_state"
      in   = ["completed", "failed"]
    }
  }
}

data "tama_action" "get-profile" {
  specification_id = tama_specification.personalization-spec.id
  identifier       = "get-profile"
}

resource "tama_prompt" "check-profile" {
  space_id = tama_space.example.id
  name     = "Check Profile"
  role     = "system"
  content  = file("${path.module}/check-profile.md")
}

resource "tama_chain" "load-profile-and-greet" {
  space_id = tama_space.example.id
  name     = "Load Profile and Greet"
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

module "load-profile-tooling" {
  source = "../../modules/tooling"

  depends_on = [module.global.schemas]

  chain_id = tama_chain.load-profile-and-greet.id
  index    = 0
  relation = "tooling"

  action_ids = [
    data.tama_action.get-profile.id
  ]

  tool_call_model_id          = module.xai.model_ids.grok-3-mini
  tool_call_model_temperature = 0.0
  tool_call_model_parameters = {
    reasoning_effort = "high"
    temperature      = 1.0
  }

  contexts = {
    check_profile = {
      prompt_id = tama_prompt.check-profile.id
      layer     = 0
      inputs = [
        {
          type            = "metadata"
          class_corpus_id = module.global.context_metadata_corpus_id
        }
      ]
    }
  }
}
