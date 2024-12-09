# This resource supports the following arguments:
variable "bucket" {
  type = string
  default = ""
  description = "(Optional, Forces new resource) Name of the bucket. If omitted, Terraform will assign a random, unique name. Must be lowercase and less than or equal to 63 characters in length. A full list of bucket naming rules may be found here. The name must not be in the format [bucket_name]--[azid]--x-s3. Use the aws_s3_directory_bucket resource to manage S3 Express buckets."
}
variable "bucket_prefix" {
  type = string
  default = ""
  description = "(Optional, Forces new resource) Creates a unique bucket name beginning with the specified prefix. Conflicts with bucket. Must be lowercase and less than or equal to 37 characters in length. A full list of bucket naming rules may be found here."
}
variable "force_destroy" {
  type = bool
  default = false
  description = "(Optional, Default:false) Boolean that indicates all objects (including any locked objects) should be deleted from the bucket when the bucket is destroyed so that the bucket can be destroyed without error. These objects are not recoverable. This only deletes objects when the bucket is destroyed, not when setting this parameter to true. Once this parameter is set to true, there must be a successful terraform apply run before a destroy is required to update this value in the resource state. Without a successful terraform apply after this parameter is set, this flag will have no effect. If setting this field in the same operation that would require replacing the bucket or destroying the bucket, this flag will not work. Additionally when importing a bucket, a successful terraform apply is required to set this value in state before it will take effect on a destroy operation."
}
variable "object_lock_enabled" {
  type = bool
  default = false
  description = "(Optional, Forces new resource) Indicates whether this bucket has an Object Lock configuration enabled. Valid values are true or false. This argument is not supported in all regions or partitions."
}
variable "tags" {
  type = map(string)
  default = {}
  description = "(Optional) Map of tags to assign to the bucket. If configured with a provider default_tags configuration block present, tags with matching keys will overwrite those defined at the provider-level."
}



# Expiration
# The expiration configuration block supports the following arguments:
variable "expiration_date" {
  type = string
  default = ""
  description = "(Optional) Specifies the date after which you want the corresponding action to take effect."
}
variable "expiration_days" {
  type = string
  default = ""
  description = "(Optional) Specifies the number of days after object creation when the specific rule action takes effect."
}
variable "expiration_expired_object_delete_marker" {
  type = string
  default = ""
  description = "(Optional) On a versioned bucket (versioning-enabled or versioning-suspended bucket), you can add this element in the lifecycle configuration to direct Amazon S3 to delete expired object delete markers. This cannot be specified with Days or Date in a Lifecycle Expiration Policy."
}

# Transition
# The transition configuration block supports the following arguments:
variable "transition_date" {
  type = string
  default = ""
  description = "(Optional) Specifies the date after which you want the corresponding action to take effect."
}
variable "transition_days" {
  type = string
  default = ""
  description = "(Optional) Specifies the number of days after object creation when the specific rule action takes effect."
}
variable "transition_storage_class" {
  type = string
  default = ""
  description = "(Required) Specifies the Amazon S3 storage class to which you want the object to transition."
}

# Noncurrent Version Expiration
# The noncurrent_version_expiration configuration block supports the following arguments:
variable "noncurrent_version_expiration_days" {
  type = string
  default = ""
  description = "(Required) Specifies the number of days noncurrent object versions expire."
}

# Noncurrent Version Transition
# The noncurrent_version_transition configuration supports the following arguments:
variable "noncurrent_version_transition_days" {
  type = string
  default = ""
  description = "(Required) Specifies the number of days noncurrent object versions transition."
}
variable "noncurrent_version_transition_storage_class" {
  type = string
  default = ""
  description = "(Required) Specifies the Amazon S3 storage class to which you want the object to transition."
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
variable "default_retention_mode" {
  type = string
  default = ""
  description = "(Required) Default Object Lock retention mode you want to apply to new objects placed in this bucket. Valid values are GOVERNANCE and COMPLIANCE."
}
variable "default_retention_days" {
  type = string
  default = ""
  description = "(Optional) Number of days that you want to specify for the default retention period."
}
variable "default_retention_years" {
  type = string
  default = ""
  description = "(Optional) Number of years that you want to specify for the default retention period."
}

# Rules
# The rules configuration block supports the following arguments:
# NOTE:
# Amazon S3's latest version of the replication configuration is V2, which includes the filter attribute for replication rules. With the filter attribute, you can specify object filters based on the object key prefix, tags, or both to scope the objects that the rule applies to. Replication configuration V1 supports filtering based on only the prefix attribute. For backwards compatibility, Amazon S3 continues to support the V1 configuration.
variable "rules_delete_marker_replication_status" {
  type = string
  default = ""
  description = "(Optional) Whether delete markers are replicated. The only valid value is Enabled. To disable, omit this argument. This argument is only valid with V2 replication configurations (i.e., when filter is used)."
}
variable "rules_destination" {
  type = string
  default = ""
  description = "(Required) Specifies the destination for the rule (documented below)."
}
variable "rules_filter" {
  type = string
  default = ""
  description = "(Optional, Conflicts with prefix) Filter that identifies subset of objects to which the replication rule applies (documented below)."
}
variable "rules_id" {
  type = string
  default = ""
  description = "(Optional) Unique identifier for the rule. Must be less than or equal to 255 characters in length."
}
variable "rules_prefix" {
  type = string
  default = ""
  description = "(Optional, Conflicts with filter) Object keyname prefix identifying one or more objects to which the rule applies. Must be less than or equal to 1024 characters in length."
}
variable "rules_priority" {
  type = string
  default = ""
  description = "(Optional) Priority associated with the rule. Priority should only be set if filter is configured. If not provided, defaults to 0. Priority must be unique between multiple rules."
}
variable "rules_source_selection_criteria" {
  type = string
  default = ""
  description = "(Optional) Specifies special object selection criteria (documented below)."
}
variable "rules_status" {
  type = string
  default = ""
  description = "(Required) Status of the rule. Either Enabled or Disabled. The rule is ignored if status is not Enabled."
}

# Filter
# The filter configuration block supports the following arguments:
variable "filter_prefix" {
  type = string
  default = ""
  description = "(Optional) Object keyname prefix that identifies subset of objects to which the rule applies. Must be less than or equal to 1024 characters in length."
}
variable "filter_tags" {
  type = string
  default = ""
  description = "(Optional) A map of tags that identifies subset of objects to which the rule applies. The rule applies only to objects having all the tags in its tagset."
}

# Destination
# NOTE:
# Replication to multiple destination buckets requires that priority is specified in the rules object. If the corresponding rule requires no filter, an empty configuration block filter {} must be specified.
# The destination configuration block supports the following arguments:
variable "destination_bucket" {
  type = string
  default = ""
  description = "(Required) ARN of the S3 bucket where you want Amazon S3 to store replicas of the object identified by the rule."
}
variable "destination_storage_class" {
  type = string
  default = ""
  description = "(Optional) The storage class used to store the object. By default, Amazon S3 uses the storage class of the source object to create the object replica."
}
variable "destination_replica_kms_key_id" {
  type = string
  default = ""
  description = "(Optional) Destination KMS encryption key ARN for SSE-KMS replication. Must be used in conjunction with sse_kms_encrypted_objects source selection criteria."
}
variable "destination_access_control_translation" {
  type = string
  default = ""
  description = "(Optional) Specifies the overrides to use for object owners on replication (documented below). Must be used in conjunction with account_id owner override configuration."
}
variable "destination_account_id" {
  type = string
  default = ""
  description = "(Optional) Account ID to use for overriding the object owner on replication. Must be used in conjunction with access_control_translation override configuration."
}
variable "destination_replication_time" {
  type = string
  default = ""
  description = "(Optional) Enables S3 Replication Time Control (S3 RTC) (documented below)."
}
variable "destination_metrics" {
  type = string
  default = ""
  description = "(Optional) Enables replication metrics (required for S3 RTC) (documented below)."
}

# access_control_translation Block
# The access_control_translation configuration block supports the following arguments:
variable "access_control_translation_owner" {
  type = string
  default = ""
  description = "(Required) Specifies the replica ownership. For default and valid values, see PUT bucket replication in the Amazon S3 API Reference. The only valid value is Destination."
}

# Replication Time
# The replication_time configuration block supports the following arguments:
variable "replication_time_status" {
  type = string
  default = ""
  description = "(Optional) Status of RTC. Either Enabled or Disabled."
}
variable "replication_time_minutes" {
  type = string
  default = ""
  description = "(Optional) Threshold within which objects are to be replicated. The only valid value is 15."
}

# Metrics
# The metrics configuration block supports the following arguments:
variable "metrics_status" {
  type = string
  default = ""
  description = "(Optional) Status of replication metrics. Either Enabled or Disabled."
}
variable "metrics_minutes" {
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

# Timeouts
# Configuration options:
variable "create" {
  type = string
  default = ""
  description = "(Default 20m)"
}
variable "read" {
  type = string
  default = ""
  description = "(Default 20m)"
}
variable "update" {
  type = string
  default = ""
  description = "(Default 20m)"
}
variable "delete" {
  type = string
  default = ""
  description = "(Default 60m)"
}
