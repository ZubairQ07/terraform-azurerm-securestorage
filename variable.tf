variable "resource_group_name" {
  type = string
  description = "the rg name"
}
variable "account_replication_type" {
  type = string
  description = "the replication type"
}
variable "location" {
  type = string
  description = "the resource location"
}
variable "environment" {
  type = string
  description = "the resource environment"

}
variable "storage_account_name" {
  type = string
  description = "unique storage account name"
}