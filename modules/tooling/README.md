<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_tama"></a> [tama](#requirement\_tama) | ~> 0.4 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tama"></a> [tama](#provider\_tama) | ~> 0.4 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tooling-context"></a> [tooling-context](#module\_tooling-context) | ../thought-context | n/a |

## Resources

| Name | Type |
|------|------|
| [tama_modular_thought.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/modular_thought) | resource |
| [tama_thought_processor.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_processor) | resource |
| [tama_thought_tool.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_tool) | resource |
| [tama_class.tool-call](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/class) | data source |
| [tama_space.global](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/space) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_ids"></a> [action\_ids](#input\_action\_ids) | The IDs of the actions | `list(string)` | n/a | yes |
| <a name="input_chain_id"></a> [chain\_id](#input\_chain\_id) | The ID of the chain | `string` | n/a | yes |
| <a name="input_contexts"></a> [contexts](#input\_contexts) | The contexts of the tool-calling class | <pre>map(object({<br>    prompt_id = string<br>    layer     = optional(number)<br>    inputs = optional(list(object({<br>      type            = string<br>      class_corpus_id = string<br>    })), [])<br>  }))</pre> | n/a | yes |
| <a name="input_index"></a> [index](#input\_index) | The index of the tool-calling class | `number` | `0` | no |
| <a name="input_relation"></a> [relation](#input\_relation) | The relation of the tool-calling class | `string` | `"tooling"` | no |
| <a name="input_tool_call_model_id"></a> [tool\_call\_model\_id](#input\_tool\_call\_model\_id) | The ID of the tool-call model | `string` | n/a | yes |
| <a name="input_tool_call_model_parameters"></a> [tool\_call\_model\_parameters](#input\_tool\_call\_model\_parameters) | The parameters of the tool-call model | `map(any)` | `{}` | no |
| <a name="input_tool_call_model_temperature"></a> [tool\_call\_model\_temperature](#input\_tool\_call\_model\_temperature) | The temperature of the tool-call model | `number` | `0` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->