output "rw_arn" {
  value       = local.suppress_iam ? null : aws_iam_policy.this_rw[0].arn
  description = "Read/Write S3 policy ARN. Deprecated use rw_policy output"

}

output "rw_policy" {
  value       = local.suppress_iam ? null : aws_iam_policy.this_rw[0]
  description = "Read/Write S3 policy object"
}

output "ro_arn" {
  value       = local.suppress_iam ? null : aws_iam_policy.this_ro[0].arn
  description = "Read Only S3 policy ARN. Deprecated use rw_policy output"
}

output "ro_policy" {
  value       = local.suppress_iam ? null : aws_iam_policy.this_ro[0]
  description = "Read Only S3 policy object"
}

output "s3" {
  description = "The s3 output object containing select values of the bucket."
  value = {
    id  = aws_s3_bucket.this.id
    arn = aws_s3_bucket.this.arn
  }
}


output "kms_arn" {
  value = try(
    data.aws_kms_key.this.0.arn,
    null
  )
  description = "Arn of the kms created"
}
