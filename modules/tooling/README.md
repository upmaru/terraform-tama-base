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
| [tama_modular_thought.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/modular_thought) | resource |
| [tama_thought_context.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_context) | resource |
| [tama_thought_context_input.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_context_input) | resource |
| [tama_thought_tool.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_tool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_ids"></a> [action\_ids](#input\_action\_ids) | The IDs of the actions | `list(string)` | n/a | yes |
| <a name="input_chain_id"></a> [chain\_id](#input\_chain\_id) | The ID of the chain | `string` | n/a | yes |
| <a name="input_contexts"></a> [contexts](#input\_contexts) | The contexts of the tool-calling class | <pre>map(object({<br>    prompt_id = string<br>    layer     = optional(number)<br>    inputs = list(object({<br>      type            = string<br>      class_corpus_id = string<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_index"></a> [index](#input\_index) | The index of the tool-calling class | `number` | `0` | no |
| <a name="input_relation"></a> [relation](#input\_relation) | The relation of the tool-calling class | `string` | `"tooling"` | no |
| <a name="input_tool_calling_class_id"></a> [tool\_calling\_class\_id](#input\_tool\_calling\_class\_id) | The ID of the tool-calling class | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->