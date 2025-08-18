data "tama_space" "global" {
  id = "global"
}

data "tama_class" "dynamic" {
  space_id = data.tama_space.global.id
  name     = "dynamic"
}

data "tama_class" "collection" {
  space_id = data.tama_space.global.id
  name     = "collection"
}

data "tama_class_corpus" "sample-items" {
  class_id = data.tama_class.collection.id
  slug     = "sample-items"
}

data "tama_class" "action-call" {
  space_id = data.tama_space.global.id
  name     = "action-call"
}
