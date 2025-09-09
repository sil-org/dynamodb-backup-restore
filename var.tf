variable "environment" {
  description = "The application environment, such as `production` or `staging`"
  type        = string
  default     = ""
}

variable "app_name" {
  description = "Application name"
  type        = string
}

variable "itse_app_customer" {
  description = "ITSE application customer"
  type        = string
}

variable "aws_region" {
  default     = "us-east-1"
}

variable "aws_access_key_id" {
  description = "AWS Access Key ID"
  type        = string
  sensitive   = false
}

variable "aws_secret_access_key" {
  description = "AWS Secret Access Key"
  type        = string
  sensitive   = true
}

variable "dynamodb_tables" {
  description = "List of complete DynamoDB table names to backup. Example (HCL): `["table1", "table2"]`"
  type        = list(string)
}

variable "backup_retention_days" {
  description = "Number of days to retain backups"
  type        = number
  default     = 365
}

variable "lambda_timeout" {
  description = "Lambda function timeout in seconds"
  type        = number
  default     = 900
}

variable "backup_schedule" {
  description = "Cron expression for backup schedule"
  type        = string
  default     = "cron(0 2 * * ? *)" # 2 AM daily
}

variable "backup_schedule_enabled" {
  description = "Enable or disable the automatic backup schedule"
  type        = bool
  default     = true
}

# Backblaze B2 Configuration Variables
variable "b2_application_key_id" {
  description = "Backblaze B2 Application Key ID for backup copy"
  type        = string
  sensitive   = true
  default     = ""
}

variable "b2_application_key" {
  description = "Backblaze B2 Application Key for backup copy"
  type        = string
  sensitive   = true
  default     = ""
}

variable "b2_bucket" {
  description = "Backblaze B2 bucket name for backup copy"
  type        = string
  default     = ""
}

variable "b2_endpoint" {
  description = "Backblaze B2 S3-compatible endpoint URL"
  type        = string
  default     = ""
}

variable "b2_backup_enabled" {
  description = "Enable or disable Backblaze B2 backup copy (requires B2 credentials)"
  type        = bool
  default     = false
}

# S3 bucket configuration
variable "backup_bucket_name" {
  description = "S3 bucket for backups"
  type        = string
}

# Lambda configuration
variable "lambda_runtime" {
  description = "Lambda runtime version"
  type        = string
  default     = "python3.11"
}

variable "lambda_memory_size" {
  description = "Lambda function memory size in MB"
  type        = number
  default     = 128
}

variable "restore_storage_mode" {
  description = "Storage mode for disaster recovery (s3 or b2)"
  type        = string
  default     = "s3"
}