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
| [tama_modular_thought.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/modular_thought) | resource |
| [tama_node.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/node) | resource |
| [tama_thought_path.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_path) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_class_id"></a> [class\_id](#input\_class\_id) | The class ID to use for the chain | `string` | n/a | yes |
| <a name="input_fields"></a> [fields](#input\_fields) | Name of the fields to spread | `list(string)` | n/a | yes |
| <a name="input_identifier"></a> [identifier](#input\_identifier) | Name of the identifier to use for the fields | `string` | `"id"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the chain | `string` | n/a | yes |
| <a name="input_relation"></a> [relation](#input\_relation) | Name of the relation to use for the concept | `string` | `"spread"` | no |
| <a name="input_space_id"></a> [space\_id](#input\_space\_id) | The Space ID to use for the chain | `string` | n/a | yes |
| <a name="input_target_class_ids"></a> [target\_class\_ids](#input\_target\_class\_ids) | List of class IDs to spread the entries into. | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->