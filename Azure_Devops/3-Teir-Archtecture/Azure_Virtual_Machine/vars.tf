

variable "vms" {
  type = map(any)
}

variable "rg_name" {
  type    = string
  default = "hcl-rg"
}
variable "location" {
  type    = string
  default = "east us"
}