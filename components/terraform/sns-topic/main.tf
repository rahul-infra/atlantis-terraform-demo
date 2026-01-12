variable "topic_name" {
  description = "Name of the SNS topic"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "stage" {
  description = "Stage name (e.g., dev, staging, prod)"
  type        = string
}

variable "tags" {
  description = "Additional tags to apply to the SNS topic"
  type        = map(string)
  default     = {}
}

variable "display_name" {
  description = "Display name for the SNS topic"
  type        = string
  default     = ""
}

# SNS Topic
resource "aws_sns_topic" "this" {
  name         = var.topic_name
  display_name = var.display_name != "" ? var.display_name : var.topic_name

  tags = merge(
    var.tags,
    {
      Environment = var.environment
      Stage       = var.stage
      ManagedBy   = "Terraform"
    }
  )
}

# Outputs
output "topic_arn" {
  description = "ARN of the SNS topic"
  value       = aws_sns_topic.this.arn
}

output "topic_name" {
  description = "Name of the SNS topic"
  value       = aws_sns_topic.this.name
}

output "topic_id" {
  description = "ID of the SNS topic"
  value       = aws_sns_topic.this.id
}
