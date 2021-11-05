resource "aws_kms_key" "default" {
  count                    = module.this.enabled ? 1 : 0
  deletion_window_in_days  = var.deletion_window_in_days
  enable_key_rotation      = var.enable_key_rotation
  policy                   = var.policy
  tags                     = module.this.tags
  description              = var.description
  key_usage                = var.key_usage
  customer_master_key_spec = var.customer_master_key_spec
  multi_region             = var.multi_region
}

resource "aws_kms_alias" "default" {
  count         = module.this.enabled ? 1 : 0
  name          = coalesce(var.alias, format("alias/%v", module.this.id))
  target_key_id = join("", aws_kms_key.default.*.id)
}
