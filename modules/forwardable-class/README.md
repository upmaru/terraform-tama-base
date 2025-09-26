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

No modules.

## Resources

| Name | Type |
|------|------|
| [tama_class.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_description"></a> [description](#input\_description) | Description of the Forwardable Class | `string` | n/a | yes |
| <a name="input_space_id"></a> [space\_id](#input\_space\_id) | ID of the Space | `string` | n/a | yes |
| <a name="input_title"></a> [title](#input\_title) | Title of the Forwardable Class | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_class_id"></a> [class\_id](#output\_class\_id) | The id of the class. |
<!-- END_TF_DOCS -->