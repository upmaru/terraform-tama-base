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
| [tama_chain.index-generation](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/chain) | resource |
| [tama_class.elasticsearch-mapping](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |
| [tama_class.index-generation](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |
| [tama_class_corpus.create-index-request](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class_corpus) | resource |
| [tama_class_corpus.elasticsearch-mapping](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class_corpus) | resource |
| [tama_class_corpus.remove-index-alias-request](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class_corpus) | resource |
| [tama_modular_thought.create-index](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/modular_thought) | resource |
| [tama_modular_thought.generate-index-mapping](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/modular_thought) | resource |
| [tama_modular_thought.unassign-alias](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/modular_thought) | resource |
| [tama_node.handle-index-generation](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/node) | resource |
| [tama_prompt.index-generation-rules](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/prompt) | resource |
| [tama_source_identity.manage](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/source_identity) | resource |
| [tama_space.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/space) | resource |
| [tama_specification.manage](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/specification) | resource |
| [tama_thought_context.index-generation-rules](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_context) | resource |
| [tama_thought_context_input.input-sample](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_context_input) | resource |
| [tama_thought_initializer.import-sample](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_initializer) | resource |
| [tama_thought_initializer.import-sample-for-generate](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_initializer) | resource |
| [tama_thought_initializer.merge-as-dynamic-entity](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_initializer) | resource |
| [tama_thought_module_input.input-create-index-request](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_module_input) | resource |
| [tama_thought_module_input.input-remove-alias-request](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_module_input) | resource |
| [tama_thought_processor.for-index-generation](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_processor) | resource |
| [tama_thought_tool.aliases-action](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_tool) | resource |
| [tama_thought_tool.create-index-action](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_tool) | resource |
| [tama_action.aliases](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/action) | data source |
| [tama_action.create-index](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/action) | data source |
| [tama_class.action-call](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/class) | data source |
| [tama_class.collection](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/class) | data source |
| [tama_class.dynamic](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/class) | data source |
| [tama_class_corpus.sample-items](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/class_corpus) | data source |
| [tama_space.global](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/space) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_api_key"></a> [api\_key](#input\_api\_key) | The API key for authentication | `any` | n/a | yes |
| <a name="input_endpoint"></a> [endpoint](#input\_endpoint) | The endpoint of the Elasticsearch server | `any` | n/a | yes |
| <a name="input_identity_identifier"></a> [identity\_identifier](#input\_identity\_identifier) | The identifier for the identity | `string` | `"ApiKey"` | no |
| <a name="input_index_mapping_generation_model_id"></a> [index\_mapping\_generation\_model\_id](#input\_index\_mapping\_generation\_model\_id) | The model id for index mapping generation | `string` | n/a | yes |
| <a name="input_index_mapping_generation_model_parameters"></a> [index\_mapping\_generation\_model\_parameters](#input\_index\_mapping\_generation\_model\_parameters) | The parameters to use for index generation mapping | `string` | n/a | yes |
| <a name="input_index_mapping_generation_model_temperature"></a> [index\_mapping\_generation\_model\_temperature](#input\_index\_mapping\_generation\_model\_temperature) | The temperature to use for index generation mapping | `number` | `0` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the Elasticsearch space | `string` | `"elasticsearch"` | no |
| <a name="input_schema_version"></a> [schema\_version](#input\_schema\_version) | Schema version for the model | `string` | n/a | yes |
| <a name="input_validation"></a> [validation](#input\_validation) | Used to verify that the API key is valid | <pre>object({<br/>    path   = string,<br/>    method = string,<br/>    codes  = list(number)<br/>  })</pre> | <pre>{<br/>  "codes": [<br/>    200<br/>  ],<br/>  "method": "GET",<br/>  "path": "/_cluster/health"<br/>}</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_index_generation_class_id"></a> [index\_generation\_class\_id](#output\_index\_generation\_class\_id) | The class id of index generation class |
| <a name="output_query_schema"></a> [query\_schema](#output\_query\_schema) | The query schema for elasticsearch. |
| <a name="output_space_id"></a> [space\_id](#output\_space\_id) | The space id of elasticsearch space |
| <a name="output_specification_id"></a> [specification\_id](#output\_specification\_id) | The specification id of elasticsearch specification |
<!-- END_TF_DOCS -->
