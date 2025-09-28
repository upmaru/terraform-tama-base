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
| [tama_prompt.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/prompt) | resource |
| [tama_thought_context.routing-context](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_context) | resource |
| [tama_thought_processor.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_processor) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_author_class_name"></a> [author\_class\_name](#input\_author\_class\_name) | The name of the author class | `string` | `"actor"` | no |
| <a name="input_classification_class_name"></a> [classification\_class\_name](#input\_classification\_class\_name) | The name of the classification class | `string` | `"class"` | no |
| <a name="input_classification_properties"></a> [classification\_properties](#input\_classification\_properties) | The properties of the classification class | `list(string)` | <pre>[<br>  "class",<br>  "confidence",<br>  "referenced_tool_call_ids"<br>]</pre> | no |
| <a name="input_focus_relations"></a> [focus\_relations](#input\_focus\_relations) | The relations to focus on for the thread | `list(string)` | <pre>[<br>  "tooling",<br>  "reply"<br>]</pre> | no |
| <a name="input_look_back_limit"></a> [look\_back\_limit](#input\_look\_back\_limit) | The number of messages to look back when routing | `number` | `10` | no |
| <a name="input_message_class_name"></a> [message\_class\_name](#input\_message\_class\_name) | The name of the message class | `string` | `"user-message"` | no |
| <a name="input_message_routing_class_id"></a> [message\_routing\_class\_id](#input\_message\_routing\_class\_id) | The id of the message routing class | `string` | n/a | yes |
| <a name="input_prompt"></a> [prompt](#input\_prompt) | The prompt for the router | `string` | n/a | yes |
| <a name="input_root_messaging_space_id"></a> [root\_messaging\_space\_id](#input\_root\_messaging\_space\_id) | The root messaging space | `string` | n/a | yes |
| <a name="input_routable_class_ids"></a> [routable\_class\_ids](#input\_routable\_class\_ids) | The ids of the classes to network | `list(string)` | n/a | yes |
| <a name="input_routing_model_id"></a> [routing\_model\_id](#input\_routing\_model\_id) | The model to use for routing | `string` | n/a | yes |
| <a name="input_routing_model_parameters"></a> [routing\_model\_parameters](#input\_routing\_model\_parameters) | The parameters for the routing model | `string` | n/a | yes |
| <a name="input_routing_model_temperature"></a> [routing\_model\_temperature](#input\_routing\_model\_temperature) | The temperature for the routing mode | `number` | `1` | no |
| <a name="input_thread_class_name"></a> [thread\_class\_name](#input\_thread\_class\_name) | The name of the thread class | `string` | `"thread"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_chain_id"></a> [chain\_id](#output\_chain\_id) | The ID of the router chain |
| <a name="output_routing_thought_id"></a> [routing\_thought\_id](#output\_routing\_thought\_id) | The routing thought |
| <a name="output_routing_thought_relation"></a> [routing\_thought\_relation](#output\_routing\_thought\_relation) | The routing thought relation |
<!-- END_TF_DOCS -->