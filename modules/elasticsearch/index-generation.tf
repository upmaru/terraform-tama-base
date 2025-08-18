resource "tama_chain" "index-generation" {
  space_id = tama_space.this.id
  name     = "Index Generation"
}

locals {
  mappings_relation = "mappings"
}

//
// Generate an index mappings for a sample data.
//
resource "tama_modular_thought" "generate-index-mapping" {
  chain_id        = tama_chain.index-generation.id
  index           = 0
  relation        = local.mappings_relation
  output_class_id = tama_class.elasticsearch-mapping.id

  module {
    reference = "tama/agentic/generate"
  }
}

resource "tama_thought_processor" "for-index-generation" {
  thought_id = tama_modular_thought.generate-index-mapping.id

  model_id = var.index_mapping_generation_model_id

  completion_config {
    temperature = 0.0
  }
}

resource "tama_thought_initializer" "import-sample-for-generate" {
  thought_id = tama_modular_thought.generate-index-mapping.id

  reference = "tama/initializers/import"
  class_id  = tama_class.index-generation.id
  parameters = jsonencode({
    resources = [
      {
        type     = "concept"
        property = "forwarded_from_concept_id",
        scope    = "global"
      }
    ]
  })
}

resource "tama_prompt" "index-generation-rules" {
  space_id = tama_space.this.id
  name     = "Index Generation Rules"
  role     = "user"
  content  = file("${path.module}/index-generation.md")
}

resource "tama_thought_context" "index-generation-rules" {
  thought_id = tama_modular_thought.generate-index-mapping.chain_id
  prompt_id  = tama_prompt.index-generation-rules.id
}

resource "tama_thought_context_input" "input-sample" {
  thought_context_id = tama_thought_context.index-generation-rules.id
  type               = "concept"
  class_corpus_id    = data.tama_class_corpus.sample-items.id
}

//
// Un-assign an alias from all indices.
//
resource "tama_modular_thought" "unassign-alias" {
  chain_id        = tama_chain.index-generation.id
  index           = 1
  relation        = "unassign-alias"
  output_class_id = data.tama_class.action-call.id

  module {
    reference = "tama/actions/caller"
  }
}

resource "tama_class_corpus" "remove-index-alias-request" {
  class_id = data.tama_class.dynamic.id
  name     = "Remove Index Alias Request"
  template = file("${path.module}/remove-alias-request.liquid")
}

resource "tama_thought_module_input" "input-remove-alias-request" {
  thought_id      = tama_modular_thought.unassign-alias.id
  type            = "entity"
  class_corpus_id = tama_class_corpus.remove-index-alias-request.id
}

data "tama_action" "aliases" {
  specification_id = tama_specification.manage.id
  method           = "POST"
  path             = "/_aliases"
}

resource "tama_thought_tool" "aliases-action" {
  thought_id = tama_modular_thought.unassign-alias.id
  action_id  = data.tama_action.aliases.id
}

//
// Create index based on mappings and assign alias.
//
resource "tama_modular_thought" "create-index" {
  chain_id        = tama_chain.index-generation.id
  index           = 2
  relation        = "create-index"
  output_class_id = data.tama_class.action-call.id

  module {
    reference = "tama/actions/caller"
  }
}

resource "tama_class_corpus" "create-index-request" {
  class_id = data.tama_class.dynamic.id
  name     = "Create Index Request"
  template = file("${path.module}/create-index-request.liquid")
}

resource "tama_thought_module_input" "input-create-index-request" {
  thought_id      = tama_modular_thought.create-index.id
  type            = "entity"
  class_corpus_id = tama_class_corpus.create-index-request.id
}

data "tama_action" "create-index" {
  specification_id = tama_specification.manage.id
  method           = "PUT"
  path             = "/{index}"
}

resource "tama_thought_tool" "create-index-action" {
  thought_id = tama_modular_thought.create-index.id
  action_id  = data.tama_action.create-index.id
}

//
// Initializers for unassign-alias and create-index thoughts.
//

locals {
  import_and_merge_thought_ids = [
    tama_modular_thought.unassign-alias.id,
    tama_modular_thought.create-index.id
  ]
}

resource "tama_thought_initializer" "import-sample" {
  count = length(local.import_and_merge_thought_ids)

  thought_id = local.import_and_merge_thought_ids[count.index]

  index     = 0
  class_id  = tama_class.index-generation.id
  reference = "tama/initializers/import"
  parameters = jsonencode({
    resources = [
      {
        type     = "concept"
        property = "forwarded_from_concept_id"
        scope    = "global"
      }
    ]
  })
}

//
// Merge the mappings from tama_modular_thought.generate-index-mapping with sample
// resulting in an entity with the following structure:
// {
//   "mappings": the-mapping,
//   "sample": the-sample
// }
// This is required by the liquid templates.
//
resource "tama_thought_initializer" "merge-as-dynamic-entity" {
  count = length(local.import_and_merge_thought_ids)

  thought_id = local.import_and_merge_thought_ids[count.index]

  index    = 1
  class_id = tama_class.index-generation.id
  parameters = jsonencode({
    relations = [local.mappings_relation, "sample"]
  })
}

resource "tama_node" "handle-index-generation" {
  space_id = tama_space.this.id
  class_id = tama_class.index-generation.id
  chain_id = tama_chain.index-generation.id

  type = "reactive"
}
