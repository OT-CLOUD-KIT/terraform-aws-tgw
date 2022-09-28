locals {
  vpc_attachments = { for attachment in var.vpc_attachments : attachment.name => attachment }
}
