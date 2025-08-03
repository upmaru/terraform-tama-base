provider "tama" {
  base_url = var.tama_base_url
  api_key  = var.tama_api_key
}

module "global" {
  source = "../../"
}

module "memovee" {
  source     = "../../modules/messaging"
  depends_on = [module.global.schemas]

  name                    = "memovee"
  entity_network_class_id = module.global.schemas["entity-network"].id
}

module "router" {
  source = "../../modules/router"

  root_messaging_space_id    = module.memovee.space.id
  network_message_thought_id = module.memovee.network_message_thought_id

  message_routing_class_id = module.global.schemas["message-routing"].id

  routable_class_ids = [
    module.memovee.schemas["user-message"].id
  ]

  prompt = file("${path.module}/prompt.md")
}
