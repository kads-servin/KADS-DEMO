module "create_vpc" {
  source      = "github.com:kads-servin/GCP-RD//modules/Network/"
  project_id  = var.project_id
  vpc_name    = "vpc-name"
  subnet_name = "subnet-name"
}

module "create_gce" {
  source       = "github.com:kads-servin/GCP-RD//modules/GCE/"
  project_id   = var.project_id
  name         = "gce-kads-demo"
  machine_type = "n2d-standard-2"
  vpc_name     = module.create_vpc.vpc_selflink
  subnet_name  = module.create_vpc.subnet_selflink
  depends_on   = [module.create_vpc]
}


