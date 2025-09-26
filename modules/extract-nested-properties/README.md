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
| [tama_class_operation.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class_operation) | resource |
| [tama_modular_thought.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/modular_thought) | resource |
| [tama_node.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/node) | resource |
| [tama_thought_path.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_path) | resource |
| [tama_class.class-proxy](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/class) | data source |
| [tama_class.classes](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/class) | data source |
| [tama_class.extracted](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/class) | data source |
| [tama_space.global](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/space) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_class_names"></a> [class\_names](#input\_class\_names) | List of class names to extract nested properties from | `list(string)` | n/a | yes |
| <a name="input_depth"></a> [depth](#input\_depth) | Depth of nested properties to extract | `number` | `1` | no |
| <a name="input_expected_class_names"></a> [expected\_class\_names](#input\_expected\_class\_names) | List of expected class names | `list` | `[]` | no |
| <a name="input_space_id"></a> [space\_id](#input\_space\_id) | ID of the space | `string` | n/a | yes |
| <a name="input_specification_id"></a> [specification\_id](#input\_specification\_id) | ID of the specification | `string` | n/a | yes |
| <a name="input_types"></a> [types](#input\_types) | List of types to extract nested properties from can be array, object | `list` | <pre>[<br/>  "array"<br/>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_extracted_class_ids"></a> [extracted\_class\_ids](#output\_extracted\_class\_ids) | The IDs of the extracted classes |
<!-- END_TF_DOCS -->