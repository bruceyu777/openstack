
variable "instance_count" {
  type        = number
  description = "How many instances to create"
}

variable "start_index" {
  type        = number
  description = "Starting index for naming (e.g. 21 ⇒ node21…)"
}
