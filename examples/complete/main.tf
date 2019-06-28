provider "aws" {
  region = var.region
}

module "kms_key" {
  source                  = "../../"
  namespace               = var.namespace
  stage                   = var.stage
  name                    = var.name
  description             = "Test KMS key"
  deletion_window_in_days = 1
  enable_key_rotation     = false
}
