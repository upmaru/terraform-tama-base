data "tama_space" "global" {
  id = "global"
}

data "tama_class" "collection" {
  space_id = data.tama_space.global.id
  name     = "collection"
}

data "tama_class" "class-proxy" {
  space_id = data.tama_space.global.id
  name     = "class-proxy"
}
