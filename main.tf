module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.3.3"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  name       = "${var.name}"
  attributes = "${var.attributes}"
  delimiter  = "${var.delimiter}"
  tags       = "${var.tags}"
}

resource "aws_kms_key" "default" {
  description             = "${var.description}"
  deletion_window_in_days = "${var.deletion_window_in_days}"
  enable_key_rotation     = "${var.enable_key_rotation}"
  tags                    = "${module.label.tags}"
}

resource "aws_kms_alias" "default" {
  name          = "${coalesce(var.alias, format("alias/%v", module.label.id))}"
  target_key_id = "${aws_kms_key.default.id}"
}
