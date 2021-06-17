output "vanta-auditor-arn" {
  description = "The ARN from the Terraform-created role that you need to input into the Vanta UI at the end of the AWS connection steps."
  value       = aws_iam_role.vanta.arn
}
