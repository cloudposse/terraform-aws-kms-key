# terraform-aws-kms-key [![Build Status](https://travis-ci.org/cloudposse/terraform-aws-kms-key.svg?branch=master)](https://travis-ci.org/cloudposse/terraform-aws-kms-key)

Terraform module to provision a [KMS](https://aws.amazon.com/kms/) key with alias.

Can be used with [chamber](https://github.com/segmentio/chamber) for managing secrets by storing them in Amazon EC2 Systems Manager Parameter Store.

* https://aws.amazon.com/systems-manager/features
* https://aws.amazon.com/blogs/mt/the-right-way-to-store-secrets-using-parameter-store


## Usage

```hcl
module "kms_key" {
  source                  = "git::https://github.com/cloudposse/terraform-aws-kms-key.git?ref=master"
  namespace               = "cp"
  stage                   = "prod"
  name                    = "app"
  description             = "KMS key for chamber"
  deletion_window_in_days = 10
  enable_key_rotation     = "true"
  alias                   = "alias/parameter_store_key"
}
```


## Variables

|  Name                      |  Default                          |  Description                                             | Required  |
|:---------------------------|:----------------------------------|:---------------------------------------------------------|:---------:|
| `namespace`                | ``                                | Namespace (e.g. `cp` or `cloudposse`)                    | Yes       |
| `stage`                    | ``                                | Stage (e.g. `prod`, `dev`, `staging`)                    | Yes       |
| `name`                     | ``                                | Application or solution name  (e.g. `app`)               | Yes       |
| `attributes`               | `[]`                              | Additional attributes (_e.g._ `policy` or `role`)        | No       |
| `tags`                     | `{}`                              | Additional tags  (_e.g._ `map("Cluster","xyz")`          | No       |
| `delimiter`                | `-`                               | Delimiter to be used between `namespace`, `stage`, `name`, and `attributes`  | No       |
| `alias`                    | `alias/parameter_store_key`       | The display name of the alias. The name must start with the word `alias` followed by a forward slash     | No        |
| `deletion_window_in_days`  | `10`                              | Duration in days after which the key is deleted after destruction of the resource    | No        |
| `enable_key_rotation`      | `true`                            | Specifies whether key rotation is enabled                | No        |
| `description`              | `Parameter Store KMS master key`  | The description of the key as viewed in AWS console      | No        |


## Outputs

| Name              | Description       |
|:------------------|:------------------|
| `key_arn`         | Key ARN           |
| `key_id`          | Key ID            |
| `alias_arn`       | Alias ARN         |
| `alias_name`      | Alias name        |


## Help

**Got a question?**

File a GitHub [issue](https://github.com/cloudposse/terraform-aws-kms-key/issues), send us an [email](mailto:hello@cloudposse.com) or reach out to us on [Gitter](https://gitter.im/cloudposse/).


## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/cloudposse/terraform-aws-kms-key/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing `terraform-aws-kms-key`, we would love to hear from you! Shoot us an [email](mailto:hello@cloudposse.com).

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull request** so that we can review your changes

**NOTE:** Be sure to merge the latest from "upstream" before making a pull request!


## License

[APACHE 2.0](LICENSE) © 2018 [Cloud Posse, LLC](https://cloudposse.com)

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.


## About

`terraform-aws-kms-key` is maintained and funded by [Cloud Posse, LLC][website].

![Cloud Posse](https://cloudposse.com/logo-300x69.png)


Like it? Please let us know at <hello@cloudposse.com>

We love [Open Source Software](https://github.com/cloudposse/)!

See [our other projects][community]
or [hire us][hire] to help build your next cloud platform.

  [website]: https://cloudposse.com/
  [community]: https://github.com/cloudposse/
  [hire]: https://cloudposse.com/contact/


### Contributors

| [![Erik Osterman][erik_img]][erik_web]<br/>[Erik Osterman][erik_web] | [![Andriy Knysh][andriy_img]][andriy_web]<br/>[Andriy Knysh][andriy_web] |
|-------------------------------------------------------|------------------------------------------------------------------|

  [erik_img]: http://s.gravatar.com/avatar/88c480d4f73b813904e00a5695a454cb?s=144
  [erik_web]: https://github.com/osterman/
  [andriy_img]: https://avatars0.githubusercontent.com/u/7356997?v=4&u=ed9ce1c9151d552d985bdf5546772e14ef7ab617&s=144
  [andriy_web]: https://github.com/aknysh/
