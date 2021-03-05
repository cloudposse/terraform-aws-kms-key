variable "deletion_window_in_days" {
  type        = number
  default     = 10
  description = "Duration in days after which the key is deleted after destruction of the resource"
}

variable "enable_key_rotation" {
  type        = bool
  default     = true
  description = "Specifies whether key rotation is enabled"
}

variable "description" {
  type        = string
  default     = "Parameter Store KMS master key"
  description = "The description of the key as viewed in AWS console"
}

variable "alias" {
  type        = string
  default     = ""
  description = "The display name of the alias. The name must start with the word `alias` followed by a forward slash. If not specified, the alias name will be auto-generated."
}

variable "policy" {
  type        = string
  default     = ""
  description = <<-EOF
    A valid KMS policy JSON document. Note that if the policy document is not
    specific enough (but still valid), Terraform may view the policy as
    constantly changing in a terraform plan. In this case, please make sure you
    use the verbose/specific version of the policy. This variable takes
    precedence over other 'policy_*' variables.
  EOF
}

variable "policy_key_admins" {
  type        = list(string)
  default     = null
  description = <<-EOF
    A list of AWS principals allowed to administer this key. You can specify
    ARNs of IAM users/roles, and AWS account IDs.

    If you do not provide any value for this variable, access will be granted to
    the entire account. If you do not want any principal to have this access,
    specify [].

    This variable is ignored if the 'policy' variable is set.
  EOF
}

variable "policy_key_users" {
  type        = list(string)
  default     = null
  description = <<-EOF
    A list of AWS principals allowed to use this key for cryptographic
    operations. You can specify ARNs of IAM users/roles, and AWS account IDs.

    If you do not provide any value for this variable, access will be granted to
    the entire account. If you do not want any principal to have this access,
    specify [].

    This variable is ignored if the 'policy' variable is set.
  EOF
}

variable "policy_key_grantors" {
  type        = list(string)
  default     = null
  description = <<-EOF
    A list of AWS principals allowed to grant use of this key to AWS resources.
    You can specify ARNs of IAM users/roles, and AWS account IDs.

    If you do not provide any value for this variable, access will be granted to
    the entire account. If you do not want any principal to have this access,
    specify [].

    This variable is ignored if the 'policy' variable is set.
  EOF
}

variable "policy_key_aws_services" {
  type        = list(string)
  default     = []
  description = <<-EOF
    A list of AWS services allowed to use this key.

    This variable is ignored if the 'policy' variable is set.
  EOF
}

variable "policy_extra_statements" {
  type        = list(string)
  default     = []
  description = <<-EOF
    A list of additional IAM policy statements to attach to the key policy.
    These statements should be in JSON (string) format.

    This variable is ignored if the 'policy' variable is set.
  EOF
}
