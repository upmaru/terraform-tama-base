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
| [tama_modular_thought.request](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/modular_thought) | resource |
| [tama_modular_thought.response](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/modular_thought) | resource |
| [tama_node.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/node) | resource |
| [tama_thought_module_input.convert-to-json](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_module_input) | resource |
| [tama_thought_module_input.request](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_module_input) | resource |
| [tama_thought_tool.request](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_tool) | resource |
| [tama_class.action-call](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/class) | data source |
| [tama_class_corpus.action-response-to-json](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/class_corpus) | data source |
| [tama_space.global](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/space) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_identifier"></a> [identifier](#input\_identifier) | The identifier of the record. | `string` | `"id"` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the chain. | `string` | n/a | yes |
| <a name="input_origin_class_id"></a> [origin\_class\_id](#input\_origin\_class\_id) | The ID of the class of entities that start the crawl. | `string` | n/a | yes |
| <a name="input_process_entity"></a> [process\_entity](#input\_process\_entity) | Whether to process the entity. | `bool` | `true` | no |
| <a name="input_request_action_id"></a> [request\_action\_id](#input\_request\_action\_id) | The ID of the action that will be executed when the request is made. | `string` | n/a | yes |
| <a name="input_request_input_corpus_id"></a> [request\_input\_corpus\_id](#input\_request\_input\_corpus\_id) | The ID of the corpus where the request input will be passed into. | `string` | n/a | yes |
| <a name="input_request_relation"></a> [request\_relation](#input\_request\_relation) | The relation of the request. | `string` | n/a | yes |
| <a name="input_response_relation"></a> [response\_relation](#input\_response\_relation) | The relation of the response. | `string` | n/a | yes |
| <a name="input_space_id"></a> [space\_id](#input\_space\_id) | The ID of the space where the chain will be created. | `string` | n/a | yes |
| <a name="input_validate_record"></a> [validate\_record](#input\_validate\_record) | Whether to validate the record on creation. | `bool` | `true` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->