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