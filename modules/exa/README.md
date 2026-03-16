# Exa Module

Creates a dedicated Tama component space for Exa Search and exposes the generated
`specification_id` for use by tooling or other modules.

## Usage

```hcl
module "exa" {
  source = "../../modules/exa"

  api_key = var.exa_api_key
}
```

## Output

- `specification_id`: The Exa specification ID to pass into downstream modules.
