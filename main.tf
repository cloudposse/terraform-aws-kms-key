resource "aws_kms_key" "default" {
  count                   = module.this.enabled ? 1 : 0
  deletion_window_in_days = var.deletion_window_in_days
  enable_key_rotation     = var.enable_key_rotation
  policy                  = var.policy
  tags                    = module.this.tags
  description             = var.description
}

resource "aws_kms_alias" "default" {
  count         = module.this.enabled ? 1 : 0
  name          = coalesce(var.alias, format("alias/%v", module.this.id))
  target_key_id = join("", aws_kms_key.default.*.id)
}
