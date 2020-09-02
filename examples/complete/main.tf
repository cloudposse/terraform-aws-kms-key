provider "aws" {
  region = var.region
}

module "kms_key" {
  source = "../../"

  description             = "Test KMS key"
  deletion_window_in_days = 7
  enable_key_rotation     = false

  context = module.this.context
}
