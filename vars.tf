variable "bucket" {
  type        = string
  default     = "nonamebucket"
  description = "The name of the s3 bucket"
}

variable "force_destroy" {
  type        = string
  default     = false
  description = "A bool that indicates all objects (including any locked objects) should be deleted from the bucket so that the bucket can be destroyed without error. These objects are not recoverable."
}

variable "object_lock_enabled" {
  type        = string
  default     = false
  description = "Indicates whether this bucket has an Object Lock configuration enabled."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "A map of tags to assign to the bucket."
}


# CORS Rule
# NOTE:
# Currently, changes to the cors_rule configuration of existing resources cannot be automatically detected by Terraform. To manage changes of CORS rules to an S3 bucket, use the aws_s3_bucket_cors_configuration resource instead. If you use cors_rule on an aws_s3_bucket, Terraform will assume management over the full set of CORS rules for the S3 bucket, treating additional CORS rules as drift. For this reason, cors_rule cannot be mixed with the external aws_s3_bucket_cors_configuration resource for a given S3 bucket.
# The cors_rule configuration block supports the following arguments:

variable "allowed_headers" {
  type = string
  default = ""
  description = "(Optional) List of headers allowed."
}
variable "allowed_methods" {
  type = string
  default = ""
  description = "(Required) One or more HTTP methods that you allow the origin to execute. Can be GET, PUT, POST, DELETE or HEAD."
}
variable "allowed_origins" {
  type = string
  default = ""
  description = "(Required) One or more origins you want customers to be able to access the bucket from."
}
variable "expose_headers" {
  type = string
  default = ""
  description = "(Optional) One or more headers in the response that you want customers to be able to access from their applications (for example, from a JavaScript XMLHttpRequest object)."
}
variable "max_age_seconds" {
  type = string
  default = ""
  description = "(Optional) Specifies time in seconds that browser can cache the response for a preflight request."
}

# Grant
# NOTE:
# Currently, changes to the grant configuration of existing resources cannot be automatically detected by Terraform. To manage changes of ACL grants to an S3 bucket, use the aws_s3_bucket_acl resource instead. If you use grant on an aws_s3_bucket, Terraform will assume management over the full set of ACL grants for the S3 bucket, treating additional ACL grants as drift. For this reason, grant cannot be mixed with the external aws_s3_bucket_acl resource for a given S3 bucket.
# The grant configuration block supports the following arguments:

variable "id" {
  type = string
  default = ""
  description = "(Optional) Canonical user id to grant for. Used only when type is CanonicalUser."
}
variable "type" {
  type = string
  default = ""
  description = "(Required) Type of grantee to apply for. Valid values are CanonicalUser and Group. AmazonCustomerByEmail is not supported."
}
variable "permissions" {
  type = string
  default = ""
  description = "(Required) List of permissions to apply for grantee. Valid values are READ, WRITE, READ_ACP, WRITE_ACP, FULL_CONTROL."
}
variable "uri" {
  type = string
  default = ""
  description = "(Optional) Uri address to grant for. Used only when type is Group."
}

# Lifecycle Rule
# NOTE:
# Currently, changes to the lifecycle_rule configuration of existing resources cannot be automatically detected by Terraform. To manage changes of Lifecycle rules to an S3 bucket, use the aws_s3_bucket_lifecycle_configuration resource instead. If you use lifecycle_rule on an aws_s3_bucket, Terraform will assume management over the full set of Lifecycle rules for the S3 bucket, treating additional Lifecycle rules as drift. For this reason, lifecycle_rule cannot be mixed with the external aws_s3_bucket_lifecycle_configuration resource for a given S3 bucket.
# NOTE:
# At least one of abort_incomplete_multipart_upload_days, expiration, transition, noncurrent_version_expiration, noncurrent_version_transition must be specified.
# The lifecycle_rule configuration block supports the following arguments:

variable "id" {
  type = string
  default = ""
  description = "(Optional) Unique identifier for the rule. Must be less than or equal to 255 characters in length."
}
variable "prefix" {
  type = string
  default = ""
  description = "(Optional) Object key prefix identifying one or more objects to which the rule applies."
}
variable "tags" {
  type = string
  default = ""
  description = "(Optional) Specifies object tags key and value."
}
variable "enabled" {
  type = string
  default = ""
  description = "(Required) Specifies lifecycle rule status."
}
variable "abort_incomplete_multipart_upload_days" {
  type = string
  default = ""
  description = "ptional) Specifies the number of days after initiating a multipart upload when the multipart upload must be completed."
}
variable "expiration" {
  type = string
  default = ""
  description = "(Optional) Specifies a period in the object's expire. See Expiration below for details."
}
variable "transition" {
  type = string
  default = ""
  description = "(Optional) Specifies a period in the object's transitions. See Transition below for details."
}
variable "noncurrent_version_expiration" {
  type = string
  default = ""
  description = "(Optional) Specifies when noncurrent object versions expire. See Noncurrent Version Expiration below for details."
}
variable "noncurrent_version_transition" {
  type = string
  default = ""
  description = "(Optional) Specifies when noncurrent object versions transitions. See Noncurrent Version Transition below for details."
}

# Expiration
# The expiration configuration block supports the following arguments:
variable "date" {
  type = string
  default = ""
  description = "(Optional) Specifies the date after which you want the corresponding action to take effect."
}
variable "days" {
  type = string
  default = ""
  description = "(Optional) Specifies the number of days after object creation when the specific rule action takes effect."
}
variable "expired_object_delete_marker" {
  type = string
  default = ""
  description = "(Optional) On a versioned bucket (versioning-enabled or versioning-suspended bucket), you can add this element in the lifecycle configuration to direct Amazon S3 to delete expired object delete markers. This cannot be specified with Days or Date in a Lifecycle Expiration Policy."
}

# Transition
# The transition configuration block supports the following arguments:
variable "date" {
  type = string
  default = ""
  description = "(Optional) Specifies the date after which you want the corresponding action to take effect."
}
variable "days" {
  type = string
  default = ""
  description = "(Optional) Specifies the number of days after object creation when the specific rule action takes effect."
}
variable "storage_class" {
  type = string
  default = ""
  description = "(Required) Specifies the Amazon S3 storage class to which you want the object to transition."
}

# Noncurrent Version Expiration
# The noncurrent_version_expiration configuration block supports the following arguments:
variable "days" {
  type = string
  default = ""
  description = "(Required) Specifies the number of days noncurrent object versions expire."
}

# Noncurrent Version Transition
# The noncurrent_version_transition configuration supports the following arguments:
variable "days" {
  type = string
  default = ""
  description = "(Required) Specifies the number of days noncurrent object versions transition."
}
variable "storage_class" {
  type = string
  default = ""
  description = "(Required) Specifies the Amazon S3 storage class to which you want the object to transition."
}

# Logging
# NOTE:
# Currently, changes to the logging configuration of existing resources cannot be automatically detected by Terraform. To manage changes of logging parameters to an S3 bucket, use the aws_s3_bucket_logging resource instead. If you use logging on an aws_s3_bucket, Terraform will assume management over the full set of logging parameters for the S3 bucket, treating additional logging parameters as drift. For this reason, logging cannot be mixed with the external aws_s3_bucket_logging resource for a given S3 bucket.
# The logging configuration block supports the following arguments:

variable "target_bucket" {
  type = string
  default = ""
  description = "(Required) Name of the bucket that will receive the log objects."
}
variable "target_prefix" {
  type = string
  default = ""
  description = "(Optional) To specify a key prefix for log objects."
}

# Object Lock Configuration
# NOTE:
# You can only enable S3 Object Lock for new buckets. If you need to enable S3 Object Lock for an existing bucket, please contact AWS Support. When you create a bucket with S3 Object Lock enabled, Amazon S3 automatically enables versioning for the bucket. Once you create a bucket with S3 Object Lock enabled, you can't disable Object Lock or suspend versioning for the bucket.
# NOTE:
# Currently, changes to the object_lock_configuration configuration of existing resources cannot be automatically detected by Terraform. To manage changes of Object Lock settings to an S3 bucket, use the aws_s3_bucket_object_lock_configuration resource instead. If you use object_lock_configuration on an aws_s3_bucket, Terraform will assume management over the full set of Object Lock configuration parameters for the S3 bucket, treating additional Object Lock configuration parameters as drift. For this reason, object_lock_configuration cannot be mixed with the external aws_s3_bucket_object_lock_configuration resource for a given S3 bucket.
# The object_lock_configuration configuration block supports the following arguments:

variable "object_lock_enabled" {
  type = string
  default = ""
  description = "(Optional, Deprecated) Indicates whether this bucket has an Object Lock configuration enabled. Valid value is Enabled. Use the top-level argument object_lock_enabled instead."
}
variable "rule" {
  type = string
  default = ""
  description = "(Optional) Object Lock rule in place for this bucket (documented below)."
}

# Rule
# The rule configuration block supports the following argument:
variable "default_retention" {
  type = string
  default = ""
  description = "(Required) Default retention period that you want to apply to new objects placed in this bucket (documented below)."
}
# Default Retention
# The default_retention configuration block supports the following arguments:
# NOTE:
# Either days or years must be specified, but not both.
variable mode {
  type = string
  default = ""
  description = "(Required) Default Object Lock retention mode you want to apply to new objects placed in this bucket. Valid values are GOVERNANCE and COMPLIANCE."
}
variable days {
  type = string
  default = ""
  description = "(Optional) Number of days that you want to specify for the default retention period."
}
variable years {
  type = string
  default = ""
  description = "(Optional) Number of years that you want to specify for the default retention period."
}

# Replication Configuration
# NOTE:
# Currently, changes to the replication_configuration configuration of existing resources cannot be automatically detected by Terraform. To manage replication configuration changes to an S3 bucket, use the aws_s3_bucket_replication_configuration resource instead. If you use replication_configuration on an aws_s3_bucket, Terraform will assume management over the full replication configuration for the S3 bucket, treating additional replication configuration rules as drift. For this reason, replication_configuration cannot be mixed with the external aws_s3_bucket_replication_configuration resource for a given S3 bucket.
# The replication_configuration configuration block supports the following arguments:
variable "role" {
  type = string
  default = ""
  description = "(Required) ARN of the IAM role for Amazon S3 to assume when replicating the objects."
}
variable "rules" {
  type = string
  default = ""
  description = "(Required) Specifies the rules managing the replication (documented below)."
}

# Rules
# The rules configuration block supports the following arguments:
# NOTE:
# Amazon S3's latest version of the replication configuration is V2, which includes the filter attribute for replication rules. With the filter attribute, you can specify object filters based on the object key prefix, tags, or both to scope the objects that the rule applies to. Replication configuration V1 supports filtering based on only the prefix attribute. For backwards compatibility, Amazon S3 continues to support the V1 configuration.
variable "delete_marker_replication_status" {
  type = string
  default = ""
  description = "(Optional) Whether delete markers are replicated. The only valid value is Enabled. To disable, omit this argument. This argument is only valid with V2 replication configurations (i.e., when filter is used)."
}
variable "destination" {
  type = string
  default = ""
  description = "(Required) Specifies the destination for the rule (documented below)."
}
variable "filter" {
  type = string
  default = ""
  description = "(Optional, Conflicts with prefix) Filter that identifies subset of objects to which the replication rule applies (documented below)."
}
variable "id" {
  type = string
  default = ""
  description = "(Optional) Unique identifier for the rule. Must be less than or equal to 255 characters in length."
}
variable "prefix" {
  type = string
  default = ""
  description = "(Optional, Conflicts with filter) Object keyname prefix identifying one or more objects to which the rule applies. Must be less than or equal to 1024 characters in length."
}
variable "priority" {
  type = string
  default = ""
  description = "(Optional) Priority associated with the rule. Priority should only be set if filter is configured. If not provided, defaults to 0. Priority must be unique between multiple rules."
}
variable "source_selection_criteria" {
  type = string
  default = ""
  description = "(Optional) Specifies special object selection criteria (documented below)."
}
variable "status" {
  type = string
  default = ""
  description = "(Required) Status of the rule. Either Enabled or Disabled. The rule is ignored if status is not Enabled."
}

# Filter
# The filter configuration block supports the following arguments:
variable "prefix" {
  type = string
  default = ""
  description = "(Optional) Object keyname prefix that identifies subset of objects to which the rule applies. Must be less than or equal to 1024 characters in length."
}
variable "tags" {
  type = string
  default = ""
  description = "(Optional) A map of tags that identifies subset of objects to which the rule applies. The rule applies only to objects having all the tags in its tagset."
}

# Destination
# NOTE:
# Replication to multiple destination buckets requires that priority is specified in the rules object. If the corresponding rule requires no filter, an empty configuration block filter {} must be specified.
# The destination configuration block supports the following arguments:

variable "bucket" {
  type = string
  default = ""
  description = "(Required) ARN of the S3 bucket where you want Amazon S3 to store replicas of the object identified by the rule."
}
variable "storage_class" {
  type = string
  default = ""
  description = "(Optional) The storage class used to store the object. By default, Amazon S3 uses the storage class of the source object to create the object replica."
}
variable "replica_kms_key_id" {
  type = string
  default = ""
  description = "(Optional) Destination KMS encryption key ARN for SSE-KMS replication. Must be used in conjunction with sse_kms_encrypted_objects source selection criteria."
}
variable "access_control_translation" {
  type = string
  default = ""
  description = "(Optional) Specifies the overrides to use for object owners on replication (documented below). Must be used in conjunction with account_id owner override configuration."
}
variable "account_id" {
  type = string
  default = ""
  description = "(Optional) Account ID to use for overriding the object owner on replication. Must be used in conjunction with access_control_translation override configuration."
}
variable "replication_time" {
  type = string
  default = ""
  description = "(Optional) Enables S3 Replication Time Control (S3 RTC) (documented below)."
}
variable "metrics" {
  type = string
  default = ""
  description = "(Optional) Enables replication metrics (required for S3 RTC) (documented below)."
}

# access_control_translation Block
# The access_control_translation configuration block supports the following arguments:
variable "owner" {
  type = string
  default = ""
  description = "(Required) Specifies the replica ownership. For default and valid values, see PUT bucket replication in the Amazon S3 API Reference. The only valid value is Destination."
}

# Replication Time
# The replication_time configuration block supports the following arguments:
variable "status" {
  type = string
  default = ""
  description = "(Optional) Status of RTC. Either Enabled or Disabled."
}
variable "minutes" {
  type = string
  default = ""
  description = "(Optional) Threshold within which objects are to be replicated. The only valid value is 15."
}

# Metrics
# The metrics configuration block supports the following arguments:
variable "status" {
  type = string
  default = ""
  description = "(Optional) Status of replication metrics. Either Enabled or Disabled."
}
variable "minutes" {
  type = string
  default = ""
  description = "(Optional) Threshold within which objects are to be replicated. The only valid value is 15."
}

# Source Selection Criteria
# The source_selection_criteria configuration block supports the following argument:
variable "sse_kms_encrypted_objects" {
  type = string
  default = ""
  description = "(Optional) Match SSE-KMS encrypted objects (documented below). If specified, replica_kms_key_id in destination must be specified as well."
}

# SSE KMS Encrypted Objects
# The sse_kms_encrypted_objects configuration block supports the following argument:
variable "enabled" {
  type = string
  default = ""
  description = "(Required) Boolean which indicates if this criteria is enabled."
}

# Server Side Encryption Configuration
# NOTE:
# Currently, changes to the server_side_encryption_configuration configuration of existing resources cannot be automatically detected by Terraform. To manage changes in encryption of an S3 bucket, use the aws_s3_bucket_server_side_encryption_configuration resource instead. If you use server_side_encryption_configuration on an aws_s3_bucket, Terraform will assume management over the encryption configuration for the S3 bucket, treating additional encryption changes as drift. For this reason, server_side_encryption_configuration cannot be mixed with the external aws_s3_bucket_server_side_encryption_configuration resource for a given S3 bucket.
# The server_side_encryption_configuration configuration block supports the following argument:
variable "rule" {
  type = string
  default = ""
  description = "(Required) Single object for server-side encryption by default configuration. (documented below)"
}

# The rule configuration block supports the following arguments:
variable "apply_server_side_encryption_by_default" {
  type = string
  default = ""
  description = "(Required) Single object for setting server-side encryption by default. (documented below)"
}
variable "bucket_key_enabled" {
  type = string
  default = ""
  description = "(Optional) Whether or not to use Amazon S3 Bucket Keys for SSE-KMS."
}

# The apply_server_side_encryption_by_default configuration block supports the following arguments:
variable "sse_algorithm" {
  type = string
  default = ""
  description = "(Required) Server-side encryption algorithm to use. Valid values are AES256 and aws:kms"
}
variable "kms_master_key_id" {
  type = string
  default = ""
  description = "(Optional) AWS KMS master key ID used for the SSE-KMS encryption. This can only be used when you set the value of sse_algorithm as aws:kms. The default aws/s3 AWS KMS master key is used if this element is absent while the sse_algorithm is aws:kms."
}

# Versioning
# NOTE:
# Currently, changes to the versioning configuration of existing resources cannot be automatically detected by Terraform. To manage changes of versioning state to an S3 bucket, use the aws_s3_bucket_versioning resource instead. If you use versioning on an aws_s3_bucket, Terraform will assume management over the versioning state of the S3 bucket, treating additional versioning state changes as drift. For this reason, versioning cannot be mixed with the external aws_s3_bucket_versioning resource for a given S3 bucket.
# The versioning configuration block supports the following arguments:
variable enabled {
  type = string
  default = ""
  description = "(Optional) Enable versioning. Once you version-enable a bucket, it can never return to an unversioned state. You can, however, suspend versioning on that bucket."
}
variable mfa_delete {
  type = string
  default = ""
  description = "(Optional) Enable MFA delete for either Change the versioning state of your bucket or Permanently delete an object version. Default is false. This cannot be used to toggle this setting but is available to allow managed buckets to reflect the state in AWS"
}

# Website
# NOTE:
# Currently, changes to the website configuration of existing resources cannot be automatically detected by Terraform. To manage changes to the website configuration of an S3 bucket, use the aws_s3_bucket_website_configuration resource instead. If you use website on an aws_s3_bucket, Terraform will assume management over the configuration of the website of the S3 bucket, treating additional website configuration changes as drift. For this reason, website cannot be mixed with the external aws_s3_bucket_website_configuration resource for a given S3 bucket.
# The website configuration block supports the following arguments:
variable "index_document" {
  type = string
  default = ""
  description = "(Required, unless using redirect_all_requests_to) Amazon S3 returns this index document when requests are made to the root domain or any of the subfolders."
}
variable "error_document" {
  type = string
  default = ""
  description = "(Optional) Absolute path to the document to return in case of a 4XX error."
}
variable "redirect_all_requests_to" {
  type = string
  default = ""
  description = "(Optional) Hostname to redirect all website requests for this bucket to. Hostname can optionally be prefixed with a protocol (http:// or https://) to use when redirecting requests. The default is the protocol that is used in the original request."
}
variable "routing_rules" {
  type = string
  default = ""
  description = "(Optional) JSON array containing routing rules describing redirect behavior and when redirects are applied."
}