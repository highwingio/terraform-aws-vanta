terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

data "aws_iam_policy_document" "vanta_additional_permissions" {
  statement {
    actions = [
      "ecr:DescribeImageScanFindings",
      "ecr:DescribeImages",
      "dynamodb:ListTagsOfResource",
      "ecr:ListTagsForResource",
      "sqs:ListQueueTags"
    ]
    resources = ["*"]
  }

  statement {
    effect = "Deny"
    actions = [
      "datapipeline:EvaluateExpression",
      "datapipeline:QueryObjects",
      "rds:DownloadDBLogFilePortion"
    ]

    resources = ["*"]
  }
}

resource "aws_iam_policy" "vanta_additional_permissions" {
  name        = "VantaAdditionalPermissions"
  description = "Additional permissions for Vanta monitoring"
  policy      = data.aws_iam_policy_document.vanta_additional_permissions.json
}

data "aws_iam_policy_document" "vanta_assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "AWS"
      identifiers = ["956993596390"]
    }

    condition {
      test     = "StringEquals"
      variable = "sts:ExternalId"
      values   = [var.external_id]
    }
  }
}

resource "aws_iam_role" "vanta" {
  name               = "vanta-auditor"
  assume_role_policy = data.aws_iam_policy_document.vanta_assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "vanta_additional_permissions" {
  role       = aws_iam_role.vanta.name
  policy_arn = aws_iam_policy.vanta_additional_permissions.arn
}

resource "aws_iam_role_policy_attachment" "vanta_aws_auditor" {
  role       = aws_iam_role.vanta.name
  policy_arn = "arn:aws:iam::aws:policy/SecurityAudit"
}
