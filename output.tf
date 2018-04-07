output "key_arn" {
  value = "${aws_kms_key.default.arn}"
}

output "key_id" {
  value = "${aws_kms_key.default.key_id}"
}

output "alias_arn" {
  value = "${aws_kms_alias.default.arn}"
}

output "alias_name" {
  value = "${aws_kms_alias.default.name}"
}
