module "label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=tags/0.3.3"
  namespace  = "${var.namespace}"
  stage      = "${var.stage}"
  name       = "${var.name}"
  attributes = "${var.attributes}"
  delimiter  = "${var.delimiter}"
  tags       = "${var.tags}"
}

data "aws_caller_identity" "current" {}

data "aws_iam_policy_document" "default" {
  statement {
    sid       = "Enable IAM User Permissions"
    effect    = "Allow"
    actions   = ["kms:*"]
    resources = ["*"]

    principals {
      type = "AWS"

      identifiers = [
        "arn:aws:iam::${data.aws_caller_identity.current.account_id}:root",
      ]
    }
  }
}

module "policy" {
  source           = "git::https://github.com/cloudposse/terraform-aws-iam-policy-document-aggregator.git?ref=tags/0.1.2"
  source_documents = ["${data.aws_iam_policy_document.default.json}" ,"${var.policy}"]
}

resource "aws_kms_key" "default" {
  description             = "${var.description}"
  deletion_window_in_days = "${var.deletion_window_in_days}"
  enable_key_rotation     = "${var.enable_key_rotation}"
  tags                    = "${module.label.tags}"
  policy                  = "${module.policy.result_document}"
}

resource "aws_kms_alias" "default" {
  name          = "${coalesce(var.alias, format("alias/%v", module.label.id))}"
  target_key_id = "${aws_kms_key.default.id}"
}
