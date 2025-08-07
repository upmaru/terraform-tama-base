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
| [tama_thought_context.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_context) | resource |
| [tama_thought_context_input.this](https://registry.terraform.io/providers/upmaru/tama/latest/docs/resources/thought_context_input) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_contexts"></a> [contexts](#input\_contexts) | The contexts of the thought | <pre>map(object({<br>    prompt_id = string<br>    layer     = optional(number)<br>    inputs = list(object({<br>      type            = string<br>      class_corpus_id = string<br>    }))<br>  }))</pre> | n/a | yes |
| <a name="input_thought_id"></a> [thought\_id](#input\_thought\_id) | The ID of the thought to which the contexts | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->