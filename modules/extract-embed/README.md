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
| [tama_modular_thought.embed](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/modular_thought) | resource |
| [tama_modular_thought.extract](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/modular_thought) | resource |
| [tama_node.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/node) | resource |
| [tama_thought_module_input.input-answer-corpus](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_module_input) | resource |
| [tama_class.answer](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/class) | data source |
| [tama_class_corpus.answer-content](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/class_corpus) | data source |
| [tama_space.global](https://registry.terraform.io/providers/upmaru/tama/latest/docs/data-sources/space) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_embeddable_class_ids"></a> [embeddable\_class\_ids](#input\_embeddable\_class\_ids) | The embeddable class IDs | `list(string)` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | Name of the Chain | `string` | n/a | yes |
| <a name="input_relations"></a> [relations](#input\_relations) | The relations | `list(string)` | <pre>[<br/>  "content"<br/>]</pre> | no |
| <a name="input_space_id"></a> [space\_id](#input\_space\_id) | The Space ID | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->