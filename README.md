# terraform-tama-base
Base modules for Tama

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_tama"></a> [tama](#requirement\_tama) | ~> 0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_tama"></a> [tama](#provider\_tama) | 0.2.15 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [tama_chain.identity-validation](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/chain) | resource |
| [tama_class.action](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |
| [tama_class.class-proxy](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |
| [tama_class.entity-network](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |
| [tama_class.forwarding](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |
| [tama_class.schemas](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class) | resource |
| [tama_class_corpus.action-call-json-corpus](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class_corpus) | resource |
| [tama_class_corpus.answer-corpus](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class_corpus) | resource |
| [tama_class_corpus.collection-sampling](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class_corpus) | resource |
| [tama_class_corpus.context-metadata-corpus](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/class_corpus) | resource |
| [tama_modular_thought.validate](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/modular_thought) | resource |
| [tama_space.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/space) | resource |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_action_call_json_corpus_id"></a> [action\_call\_json\_corpus\_id](#output\_action\_call\_json\_corpus\_id) | ID of the Action Call JSON Corpus |
| <a name="output_answer_corpus_id"></a> [answer\_corpus\_id](#output\_answer\_corpus\_id) | ID of the Answer Corpus |
| <a name="output_context_metadata_corpus_id"></a> [context\_metadata\_corpus\_id](#output\_context\_metadata\_corpus\_id) | ID of the Context Metadata Corpus |
| <a name="output_schemas"></a> [schemas](#output\_schemas) | Schemas for the Global Space |
| <a name="output_space"></a> [space](#output\_space) | The Global Space |
<!-- END_TF_DOCS -->