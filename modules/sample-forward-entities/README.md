<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_tama"></a> [tama](#requirement\_tama) | ~> 0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tama"></a> [tama](#provider\_tama) | ~> 0.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tama_chain.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/chain) | resource |
| [tama_modular_thought.forward](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/modular_thought) | resource |
| [tama_modular_thought.sampling](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/modular_thought) | resource |
| [tama_node.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/node) | resource |
| [tama_thought_context.context-to-forward](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_context) | resource |
| [tama_thought_path.forward-to-index-generation](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_path) | resource |
| [tama_thought_path.sample-class](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_path) | resource |
| [tama_class.class-proxy](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/class) | data source |
| [tama_class.collection](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/class) | data source |
| [tama_space.global](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/space) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ensure_chunk_exists"></a> [ensure\_chunk\_exists](#input\_ensure\_chunk\_exists) | Ensure to only use sample where the chunk exists | `bool` | `true` | no |
| <a name="input_forward_to_class_id"></a> [forward\_to\_class\_id](#input\_forward\_to\_class\_id) | The class ID to forward the sample to. | `string` | n/a | yes |
| <a name="input_forwarding_relation"></a> [forwarding\_relation](#input\_forwarding\_relation) | The relation of forwarding data thought. | `string` | `"forward"` | no |
| <a name="input_limit"></a> [limit](#input\_limit) | The sample size | `number` | `3` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the Chain | `string` | n/a | yes |
| <a name="input_preload_children"></a> [preload\_children](#input\_preload\_children) | List of children preloads | <pre>list(object({<br/>    class = string<br/>    on    = optional(string, "parent_entity_id")<br/>    as    = string<br/><br/>    record = optional(object({<br/>      rejections = list(object({<br/>        element = string<br/>        matches = list(string)<br/>      }))<br/>    }), { rejections = [] })<br/><br/>    concept = optional(object({<br/>      relations  = optional(list(string), [])<br/>      embeddings = optional(string, "exclude")<br/>      content = optional(object({<br/>        action = string<br/>        merge = object({<br/>          location = string<br/>          name     = string<br/>        })<br/>        }), {<br/>        action = "merge"<br/>        merge = {<br/>          location = "concept"<br/>          name     = "merge"<br/>        }<br/>      })<br/>      }), {<br/>      relations  = []<br/>      embeddings = "exclude"<br/>      content = {<br/>        action = "merge"<br/>        merge = {<br/>          location = "concept"<br/>          name     = "merge"<br/>        }<br/>      }<br/>    })<br/><br/>    parents  = optional(list(object({})), [])<br/>    children = optional(list(object({})), [])<br/>  }))</pre> | `[]` | no |
| <a name="input_preload_concept_with_relations"></a> [preload\_concept\_with\_relations](#input\_preload\_concept\_with\_relations) | List of concept relations to preload with each entity | `list(string)` | n/a | yes |
| <a name="input_preload_parents"></a> [preload\_parents](#input\_preload\_parents) | List of parents preloads | <pre>list(object({<br/>    class = string<br/>    on    = optional(string, "parent_entity_id")<br/>    as    = string<br/><br/>    record = optional(object({<br/>      rejections = list(object({<br/>        element = string<br/>        matches = list(string)<br/>      }))<br/>    }), { rejections = [] })<br/><br/>    concept = optional(object({<br/>      relations  = optional(list(string), [])<br/>      embeddings = optional(string, "exclude")<br/>      content = optional(object({<br/>        action = string<br/>        merge = object({<br/>          location = string<br/>          name     = string<br/>        })<br/>        }), {<br/>        action = "merge"<br/>        merge = {<br/>          location = "concept"<br/>          name     = "merge"<br/>        }<br/>      })<br/>      }), {<br/>      relations  = []<br/>      embeddings = "exclude"<br/>      content = {<br/>        action = "merge"<br/>        merge = {<br/>          location = "concept"<br/>          name     = "merge"<br/>        }<br/>      }<br/>    })<br/><br/>    parents  = optional(list(object({})), [])<br/>    children = optional(list(object({})), [])<br/>  }))</pre> | `[]` | no |
| <a name="input_prompt_id"></a> [prompt\_id](#input\_prompt\_id) | The prompt with constraints and rules for index generation | `string` | n/a | yes |
| <a name="input_sampling_relation"></a> [sampling\_relation](#input\_sampling\_relation) | The relation of sampling data thought. | `string` | `"sample"` | no |
| <a name="input_space_id"></a> [space\_id](#input\_space\_id) | The space ID to forward the sample to. | `string` | n/a | yes |
| <a name="input_target_class_id"></a> [target\_class\_id](#input\_target\_class\_id) | The target class ID to sample data from | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->