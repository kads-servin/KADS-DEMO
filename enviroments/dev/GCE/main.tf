module "create_vpc" {
  source      = "git::https://github.com:kads-servin/GCP-RD.git/modules/Network/"
  project_id  = var.project_id
  vpc_name    = "vpc-name"
  subnet_name = "subnet-name"
}

module "create_gce" {
  source       = "git::https://github.com:kads-servin/GCP-RD.git/modules/GCE/"
  project_id   = var.project_id
  name         = "gce-kads-demo"
  machine_type = "n2d-standard-2"
  vpc_name     = module.create_vpc.vpc_selflink
  subnet_name  = module.create_vpc.subnet_selflink
  depends_on   = [module.create_vpc]
}


