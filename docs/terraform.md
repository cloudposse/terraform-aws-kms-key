## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| alias | The display name of the alias. The name must start with the word `alias` followed by a forward slash | string | `` | no |
| attributes | Additional attributes (e.g. `1`) | list(string) | `<list>` | no |
| deletion_window_in_days | Duration in days after which the key is deleted after destruction of the resource | number | `10` | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | string | `-` | no |
| description | The description of the key as viewed in AWS console | string | `Parameter Store KMS master key` | no |
| enable_key_rotation | Specifies whether key rotation is enabled | bool | `true` | no |
| enabled | Set to false to prevent the module from creating any resources | bool | `true` | no |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | string | `` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | string | `` | no |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | string | `` | no |
| policy | A valid KMS policy JSON document. Note that if the policy document is not specific enough (but still valid), Terraform may view the policy as constantly changing in a terraform plan. In this case, please make sure you use the verbose/specific version of the policy. | string | `` | no |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | string | `` | no |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')` | map(string) | `<map>` | no |

## Outputs

| Name | Description |
|------|-------------|
| alias_arn | Alias ARN |
| alias_name | Alias name |
| key_arn | Key ARN |
| key_id | Key ID |

