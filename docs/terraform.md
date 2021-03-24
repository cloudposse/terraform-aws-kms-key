<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.26 |
| aws | >= 3.0 |
| local | >= 1.3 |
| null | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 3.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| this | cloudposse/label/null | 0.24.1 |

## Resources

| Name |
|------|
| [aws_caller_identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) |
| [aws_kms_alias](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) |
| [aws_kms_key](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| additional\_tag\_map | Additional tags for appending to tags\_as\_list\_of\_maps. Not added to `tags`. | `map(string)` | `{}` | no |
| alias | The display name of the alias. The name must start with the word `alias` followed by a forward slash. If not specified, the alias name will be auto-generated. | `string` | `""` | no |
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| context | Single object for setting entire context at once.<br>See description of individual variables for details.<br>Leave string and numeric variables as `null` to use default value.<br>Individual variable settings (non-null) override settings in context object,<br>except for attributes, tags, and additional\_tag\_map, which are merged. | `any` | <pre>{<br>  "additional_tag_map": {},<br>  "attributes": [],<br>  "delimiter": null,<br>  "enabled": true,<br>  "environment": null,<br>  "id_length_limit": null,<br>  "label_key_case": null,<br>  "label_order": [],<br>  "label_value_case": null,<br>  "name": null,<br>  "namespace": null,<br>  "regex_replace_chars": null,<br>  "stage": null,<br>  "tags": {}<br>}</pre> | no |
| customer\_master\_key\_spec | Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms or signing algorithms that the key supports. Valid values: `SYMMETRIC_DEFAULT`, `RSA_2048`, `RSA_3072`, `RSA_4096`, `ECC_NIST_P256`, `ECC_NIST_P384`, `ECC_NIST_P521`, or `ECC_SECG_P256K1`. | `string` | `"SYMMETRIC_DEFAULT"` | no |
| deletion\_window\_in\_days | Duration in days after which the key is deleted after destruction of the resource | `number` | `10` | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes`.<br>Defaults to `-` (hyphen). Set to `""` to use no delimiter at all. | `string` | `null` | no |
| description | The description of the key as viewed in AWS console | `string` | `"Parameter Store KMS master key"` | no |
| enable\_key\_rotation | Specifies whether key rotation is enabled | `bool` | `true` | no |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `null` | no |
| environment | Environment, e.g. 'uw2', 'us-west-2', OR 'prod', 'staging', 'dev', 'UAT' | `string` | `null` | no |
| id\_length\_limit | Limit `id` to this many characters (minimum 6).<br>Set to `0` for unlimited length.<br>Set to `null` for default, which is `0`.<br>Does not affect `id_full`. | `number` | `null` | no |
| key\_usage | Specifies the intended use of the key. Valid values: `ENCRYPT_DECRYPT` or `SIGN_VERIFY`. | `string` | `"ENCRYPT_DECRYPT"` | no |
| label\_key\_case | The letter case of label keys (`tag` names) (i.e. `name`, `namespace`, `environment`, `stage`, `attributes`) to use in `tags`.<br>Possible values: `lower`, `title`, `upper`.<br>Default value: `title`. | `string` | `null` | no |
| label\_order | The naming order of the id output and Name tag.<br>Defaults to ["namespace", "environment", "stage", "name", "attributes"].<br>You can omit any of the 5 elements, but at least one must be present. | `list(string)` | `null` | no |
| label\_value\_case | The letter case of output label values (also used in `tags` and `id`).<br>Possible values: `lower`, `title`, `upper` and `none` (no transformation).<br>Default value: `lower`. | `string` | `null` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | `null` | no |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `null` | no |
| policy | A valid KMS policy JSON document. Note that if the policy document is not<br>specific enough (but still valid), Terraform may view the policy as<br>constantly changing in a terraform plan. In this case, please make sure you<br>use the verbose/specific version of the policy. This variable takes<br>precedence over other 'policy\_*' variables. | `string` | `""` | no |
| policy\_extra\_statements | A list of additional IAM policy statements to attach to the key policy.<br>These statements should be in JSON (string) format.<br><br>This variable is ignored if the 'policy' variable is set. | `list(string)` | `[]` | no |
| policy\_key\_admins | A list of AWS principals allowed to administer this key. You can specify<br>ARNs of IAM users/roles, and AWS account IDs.<br><br>If you do not provide any value for this variable, access will be granted to<br>the entire account. If you do not want any principal to have this access,<br>specify [].<br><br>This variable is ignored if the 'policy' variable is set. | `list(string)` | `null` | no |
| policy\_key\_aws\_services | A list of AWS services allowed to use this key.<br><br>This variable is ignored if the 'policy' variable is set. | `list(string)` | `[]` | no |
| policy\_key\_grantors | A list of AWS principals allowed to grant use of this key to AWS resources.<br>You can specify ARNs of IAM users/roles, and AWS account IDs.<br><br>If you do not provide any value for this variable, access will be granted to<br>the entire account. If you do not want any principal to have this access,<br>specify [].<br><br>This variable is ignored if the 'policy' variable is set. | `list(string)` | `null` | no |
| policy\_key\_users | A list of AWS principals allowed to use this key for cryptographic<br>operations. You can specify ARNs of IAM users/roles, and AWS account IDs.<br><br>If you do not provide any value for this variable, access will be granted to<br>the entire account. If you do not want any principal to have this access,<br>specify [].<br><br>This variable is ignored if the 'policy' variable is set. | `list(string)` | `null` | no |
| regex\_replace\_chars | Regex to replace chars with empty string in `namespace`, `environment`, `stage` and `name`.<br>If not set, `"/[^a-zA-Z0-9-]/"` is used to remove all characters other than hyphens, letters and digits. | `string` | `null` | no |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `null` | no |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| alias\_arn | Alias ARN |
| alias\_name | Alias name |
| key\_arn | Key ARN |
| key\_id | Key ID |
<!-- markdownlint-restore -->
