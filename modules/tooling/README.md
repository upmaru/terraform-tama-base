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

| Name | Source | Version |
|------|--------|---------|
| <a name="module_tooling-context"></a> [tooling-context](#module\_tooling-context) | ../thought-context | n/a |

## Resources

| Name | Type |
|------|------|
| [tama_modular_thought.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/modular_thought) | resource |
| [tama_thought_tool.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_tool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_action_ids"></a> [action\_ids](#input\_action\_ids) | The IDs of the actions | `list(string)` | n/a | yes |
| <a name="input_assistant_response_class_id"></a> [assistant\_response\_class\_id](#input\_assistant\_response\_class\_id) | The ID of the assistant-response class | `string` | n/a | yes |
| <a name="input_chain_id"></a> [chain\_id](#input\_chain\_id) | The ID of the chain | `string` | n/a | yes |
| <a name="input_contexts"></a> [contexts](#input\_contexts) | The contexts of the tool-calling class | <pre>map(object({<br>    prompt_id = string<br>    layer     = optional(number)<br>    inputs = optional(list(object({<br>      type            = string<br>      class_corpus_id = string<br>    })), [])<br>  }))</pre> | n/a | yes |
| <a name="input_index"></a> [index](#input\_index) | The index of the tool-calling class | `number` | `0` | no |
| <a name="input_relation"></a> [relation](#input\_relation) | The relation of the tool-calling class | `string` | `"tooling"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->