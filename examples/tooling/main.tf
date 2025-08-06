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


module "load-profile-tooling" {
  source = "../../modules/tooling"

  chain_id              = tama_chain.load-profile-and-greet.id
  tool_calling_class_id = module.global.schemas["tool-calling"].id
  index                 = 0
  relation              = "tooling"

  action_ids = [
    data.tama_action.get-profile.id
  ]

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
