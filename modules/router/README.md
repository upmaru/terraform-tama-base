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
| [tama_delegated_thought.network](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/delegated_thought) | resource |
| [tama_modular_thought.routing](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/modular_thought) | resource |
| [tama_node.network](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/node) | resource |
| [tama_prompt.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/prompt) | resource |
| [tama_thought_context.routing-context](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_context) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_classification_class_name"></a> [classification\_class\_name](#input\_classification\_class\_name) | The name of the classification class | `string` | `"class"` | no |
| <a name="input_classification_properties"></a> [classification\_properties](#input\_classification\_properties) | The properties of the classification class | `list(string)` | <pre>[<br/>  "class",<br/>  "confidence"<br/>]</pre> | no |
| <a name="input_look_back_limit"></a> [look\_back\_limit](#input\_look\_back\_limit) | The number of messages to look back when routing | `number` | `5` | no |
| <a name="input_message_routing_class_id"></a> [message\_routing\_class\_id](#input\_message\_routing\_class\_id) | The id of the message routing class | `string` | n/a | yes |
| <a name="input_network_message_thought_id"></a> [network\_message\_thought\_id](#input\_network\_message\_thought\_id) | The id of the network message thought | `string` | n/a | yes |
| <a name="input_prompt"></a> [prompt](#input\_prompt) | The prompt for the router | `string` | n/a | yes |
| <a name="input_root_messaging_space_id"></a> [root\_messaging\_space\_id](#input\_root\_messaging\_space\_id) | The root messaging space | `string` | n/a | yes |
| <a name="input_routable_class_ids"></a> [routable\_class\_ids](#input\_routable\_class\_ids) | The ids of the classes to network | `list(string)` | n/a | yes |
| <a name="input_similarity_limit"></a> [similarity\_limit](#input\_similarity\_limit) | The similarity limit for the router | `number` | `10` | no |
| <a name="input_similarity_threshold"></a> [similarity\_threshold](#input\_similarity\_threshold) | The similarity threshold for the router | `number` | `0.9` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_chain_id"></a> [chain\_id](#output\_chain\_id) | The ID of the router chain |
| <a name="output_routing_thought_id"></a> [routing\_thought\_id](#output\_routing\_thought\_id) | The routing thought |
<!-- END_TF_DOCS -->