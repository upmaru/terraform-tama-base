provider "tama" {
  base_url = var.tama_base_url
  api_key  = var.tama_api_key
}

module "global" {
  source = "../../"
}

resource "tama_space" "basic-conversation" {
  name = "Basic Conversation"
  type = "component"
}

resource "tama_class" "greeting" {
  space_id    = tama_space.basic-conversation.id
  depends_on  = [module.global]
  schema_json = jsonencode(jsondecode(file("${path.module}/greeting.json")))
}

module "extract-embed" {
  source = "../../modules/extract-embed"

  space_id = tama_space.basic-conversation.id

  name = "Extract and Embed"

  answer_class_id        = module.global.schemas["answer"].id
  answer_class_corpus_id = module.global.answer_corpus_id

  relation = "content"

  embeddable_class_ids = [
    tama_class.greeting.id
  ]
}
