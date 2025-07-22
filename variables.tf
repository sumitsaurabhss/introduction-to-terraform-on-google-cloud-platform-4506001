variable "project_id" {
    type    = string
    defaut  = "corded-protocol-466606-m0"
}

variable "region" {
    type    = string
    defaut  = "us-west1"
}

variable "network_name" {
    type    = string
    defaut  = "app"
}

variable "network_ip_range" {
    type    = string
    defaut  = "10.2.0.0/16"
}

variable "image_project" {
    type    = string
    defaut  = "ubuntu-os-cloud"
}

variable "image_family" {
    type    = string
    defaut  = "ubuntu-2204-lts"
}

variable "app_name" {
    type    = string
    defaut  = "blog"
}

variable "machine_type" {
    type    = string
    defaut  = "e2-micro"
}