module "app_network" {
  source  = "terraform-google-modules/network/google"
  version = "11.1.1"
  
  network_name  = "${var.network_name}-network"
  project_id    = var.project_id

  subnets = [
    {
      subnet_name   = "subnet-01"
      subnet_ip     = "10.10.10.0/24"
      subnet_region = "us-west1"
    }
  ]

  ingress_rules  = [
    {
      name        = "${var.network_name}-web"
      description = "Inbound web"
      
      source_ranges           = ["0.0.0.0/0"]
      target_tags             = ["${var.network_name}-web"]

      allow = [
        {
          protocol = "tcp"
          ports    = ["80","443"]
        }
      ]
    }
  ]
}

data "google_compute_image" "ubuntu" {
  most_recent = true
  project     = var.image_project 
  family      = var.image_family
}

resource "google_compute_instance" "blog" {
  name         = var.app_name
  machine_type = var.machine_type

  tags         = ["${var.network_name}-web"]

  boot_disk {
    initialize_params {
      image = data.google_compute_image.ubuntu.self_link
    }
  }
  network_interface {
   subnetwork = module.app_network.subnets_names[0]
   access_config {
      # Leave empty for dynamic public IP
    }
  }  

  metadata_startup_scripts  = "apt -y update; apt -y install nginx; echo ${var.app_name} > /var/www/html/index.html"
  allow_stopping_for_update = true
}