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
| [tama_class.entity-network](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/class) | data source |
| [tama_space.global](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/space) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_can_belong_to_class_ids"></a> [can\_belong\_to\_class\_ids](#input\_can\_belong\_to\_class\_ids) | The IDs of the class to which the classes can belongs to. | `list(string)` | n/a | yes |
| <a name="input_class_ids"></a> [class\_ids](#input\_class\_ids) | The IDs of the classes to network. | `list(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the chain | `string` | n/a | yes |
| <a name="input_properties"></a> [properties](#input\_properties) | The properties to build relations with. | `list(string)` | <pre>[<br/>  "parent_entity_id"<br/>]</pre> | no |
| <a name="input_space_id"></a> [space\_id](#input\_space\_id) | The ID of the space where the chain will be created | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->