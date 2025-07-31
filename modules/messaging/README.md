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
| [tama_class.actor](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |
| [tama_class.assistant-message](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |
| [tama_class.response](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |
| [tama_class.thread](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |
| [tama_class.tool-message](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |
| [tama_class.user-message](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |
| [tama_class_corpus.user-message-corpus](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class_corpus) | resource |
| [tama_space.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/space) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_class_proxy_class_id"></a> [class\_proxy\_class\_id](#input\_class\_proxy\_class\_id) | The ID of the class proxy class | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The name of the corpus | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_schemas"></a> [schemas](#output\_schemas) | Scheams for the messaging space |
| <a name="output_space"></a> [space](#output\_space) | The messaging space id |
<!-- END_TF_DOCS -->