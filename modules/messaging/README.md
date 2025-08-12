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
| [tama_chain.network-message](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/chain) | resource |
| [tama_class.actor](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |
| [tama_class.assistant-message](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |
| [tama_class.response](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |
| [tama_class.thread](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |
| [tama_class.tool-message](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |
| [tama_class.user-message](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |
| [tama_class_corpus.user-message-corpus](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class_corpus) | resource |
| [tama_modular_thought.network](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/modular_thought) | resource |
| [tama_node.network-assistant-message](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/node) | resource |
| [tama_node.network-tool-message](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/node) | resource |
| [tama_space.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/space) | resource |
| [tama_thought_path.network-actor](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_path) | resource |
| [tama_thought_path.network-thread](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_path) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_entity_network_class_id"></a> [entity\_network\_class\_id](#input\_entity\_network\_class\_id) | The id of the entity network class | `string` | n/a | yes |
| <a name="input_foreign_keys"></a> [foreign\_keys](#input\_foreign\_keys) | The id of the foreign keys | `list(string)` | <pre>[<br/>  "thread_id",<br/>  "actor_id"<br/>]</pre> | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the corpus | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_message_thought_id"></a> [network\_message\_thought\_id](#output\_network\_message\_thought\_id) | The id of the network message thought |
| <a name="output_schemas"></a> [schemas](#output\_schemas) | Scheams for the messaging space |
| <a name="output_space"></a> [space](#output\_space) | The messaging space id |
<!-- END_TF_DOCS -->