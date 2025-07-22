module "qa" {
    source = "./modules/blog"

    project_id    = var.project_id
    region        = var.region

    app_name      = "qa-blog"
    network_name  = "qa"
}

module "np" {
    source = "./modules/blog"

    project_id    = var.project_id
    region        = var.region

    app_name      = "np-blog"
    network_name  = "np"
}

module "pd" {
    source = "./modules/blog"

    project_id    = var.project_id
    region        = var.region

    app_name      = "pd-blog"
    network_name  = "pd"
}