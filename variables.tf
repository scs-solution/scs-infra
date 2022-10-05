variable "region" {
  description = "This type will use vpc region setting."
  type        = string
  default     = "ap-northeast-2"
}

variable "is_prod" {
  description = "This type will check deploy type."
  type        = bool
}

variable "target_ami" {
  description = "Target AMI Image id"
  type        = string
  default     = "ami-0c76973fbe0ee100c"
}