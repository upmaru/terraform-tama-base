provider "tama" {
  base_url = var.tama_base_url
  api_key  = var.tama_api_key
}

module "global" {
  source = "../../"
}

module "memovee" {
  source = "../../modules/messaging"

  name                 = "memovee"
  class_proxy_class_id = module.global.schemas["class-proxy"].id
}

module "router" {
  source = "../../modules/router"

  root_messaging_space_id = module.memovee.space.id
  thread_class_id         = module.memovee.schemas["thread"].id
  actor_class_id          = module.memovee.schemas["actor"].id

  entity_network_class_id  = module.global.schemas["entity-network"].id
  message_routing_class_id = module.global.schemas["message-routing"].id

  prompt = file("${path.module}/prompt.md")
}
