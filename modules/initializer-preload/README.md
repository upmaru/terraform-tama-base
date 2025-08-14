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
| [tama_thought_initializer.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_initializer) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_children"></a> [children](#input\_children) | List of children preload | <pre>list(object({<br>    class = string<br>    on    = optional(string, "parent_entity_id")<br>    as    = string<br><br>    record = optional(object({<br>      rejections = list(object({<br>        element = string<br>        matches = list(string)<br>      }))<br>    }), { rejections = [] })<br><br>    concept = optional(object({<br>      relations  = optional(list(string), [])<br>      embeddings = optional(string, "exclude")<br>      content = object({<br>        action = string<br>        merge = object({<br>          location = string<br>          name     = string<br>        })<br>        }, {<br>        action = "merge"<br>        merge = {<br>          location = "concept"<br>          name     = "merge"<br>        }<br>      })<br>    }))<br><br>    parents  = optional(list(object({})), [])<br>    children = optional(list(object({})), [])<br>  }))</pre> | `[]` | no |
| <a name="input_class_id"></a> [class\_id](#input\_class\_id) | The ID of the class that has to match for the initializer run. | `string` | n/a | yes |
| <a name="input_concept_content"></a> [concept\_content](#input\_concept\_content) | What to do with the content of the concept | <pre>object({<br>    action = optional(string, "merge")<br>    merge = object({<br>      location = optional(string, "concept")<br>      name     = optional(string, "merge")<br>    })<br>  })</pre> | <pre>{<br>  "action": "merge",<br>  "merge": {<br>    "location": "concept",<br>    "name": "merge"<br>  }<br>}</pre> | no |
| <a name="input_concept_embeddings"></a> [concept\_embeddings](#input\_concept\_embeddings) | What to do with embeddings exclude, include or only metadata | `string` | `"exclude"` | no |
| <a name="input_concept_relations"></a> [concept\_relations](#input\_concept\_relations) | List of concept relations to preload. | `list(string)` | `[]` | no |
| <a name="input_index"></a> [index](#input\_index) | The index for the initializer lower numbers run first. | `number` | n/a | yes |
| <a name="input_parents"></a> [parents](#input\_parents) | List of parent to preload | <pre>list(object({<br>    class = string<br>    on    = optional(string, "parent_entity_id")<br>    as    = string<br><br>    record = optional(object({<br>      rejections = list(object({<br>        element = string<br>        matches = list(string)<br>      }))<br>    }), { rejections = [] })<br><br>    concept = optional(object({<br>      relations  = optional(list(string), [])<br>      embeddings = optional(string, "exclude")<br>      content = object({<br>        action = string<br>        merge = object({<br>          location = string<br>          name     = string<br>        })<br>        }, {<br>        action = "merge"<br>        merge = {<br>          location = "concept"<br>          name     = "merge"<br>        }<br>      })<br>    }))<br><br>    parents  = optional(list(object({})), [])<br>    children = optional(list(object({})), [])<br>  }))</pre> | `[]` | no |
| <a name="input_record_rejections"></a> [record\_rejections](#input\_record\_rejections) | Rejection rules for parameters in a record. | <pre>list(object({<br>    element = string<br>    matches = list(string)<br>  }))</pre> | <pre>[<br>  {<br>    "element": "value",<br>    "matches": [<br>      ""<br>    ]<br>  }<br>]</pre> | no |
| <a name="input_thought_id"></a> [thought\_id](#input\_thought\_id) | The ID of the thought. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->