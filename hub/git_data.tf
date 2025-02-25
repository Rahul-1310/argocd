# retrive from secret manager the git data for the platform and workload repositories


data "aws_secretsmanager_secret" "git_data_addons" {
  name = var.secret_name_git_data_addons
}
data "aws_secretsmanager_secret_version" "git_data_version_addons" {
  secret_id = data.aws_secretsmanager_secret.git_data_addons.id
}
data "aws_secretsmanager_secret" "git_data_platform" {
  name = var.secret_name_git_data_platform
}
data "aws_secretsmanager_secret_version" "git_data_version_platform" {
  secret_id = data.aws_secretsmanager_secret.git_data_platform.id
}
data "aws_secretsmanager_secret" "git_data_workload" {
  name = var.secret_name_git_data_workloads
}
data "aws_secretsmanager_secret_version" "git_data_version_workload" {
  secret_id = data.aws_secretsmanager_secret.git_data_workload.id
}

locals {
  gitops_addons_url      = jsondecode(data.aws_secretsmanager_secret_version.git_data_version_addons.secret_string).url
  gitops_addons_basepath = jsondecode(data.aws_secretsmanager_secret_version.git_data_version_addons.secret_string).basepath
  gitops_addons_path     = jsondecode(data.aws_secretsmanager_secret_version.git_data_version_addons.secret_string).path
  gitops_addons_revision = jsondecode(data.aws_secretsmanager_secret_version.git_data_version_addons.secret_string).revision

  gitops_addons_repo_secret_key = var.secret_name_git_data_addons
  gitops_addons_repo_username = jsondecode(data.aws_secretsmanager_secret_version.git_data_version_addons.secret_string).username
  gitops_addons_repo_password = jsondecode(data.aws_secretsmanager_secret_version.git_data_version_addons.secret_string).password

  gitops_platform_url      = jsondecode(data.aws_secretsmanager_secret_version.git_data_version_platform.secret_string).url
  gitops_platform_basepath = jsondecode(data.aws_secretsmanager_secret_version.git_data_version_platform.secret_string).basepath
  gitops_platform_path     = jsondecode(data.aws_secretsmanager_secret_version.git_data_version_platform.secret_string).path
  gitops_platform_revision = jsondecode(data.aws_secretsmanager_secret_version.git_data_version_platform.secret_string).revision

  gitops_platform_repo_secret_key = var.secret_name_git_data_platform
  gitops_platform_repo_username = jsondecode(data.aws_secretsmanager_secret_version.git_data_version_platform.secret_string).username
  gitops_platform_repo_password = jsondecode(data.aws_secretsmanager_secret_version.git_data_version_platform.secret_string).password

  gitops_workload_url      = jsondecode(data.aws_secretsmanager_secret_version.git_data_version_workload.secret_string).url
  gitops_workload_basepath = jsondecode(data.aws_secretsmanager_secret_version.git_data_version_workload.secret_string).basepath
  gitops_workload_path     = jsondecode(data.aws_secretsmanager_secret_version.git_data_version_workload.secret_string).path
  gitops_workload_revision = jsondecode(data.aws_secretsmanager_secret_version.git_data_version_workload.secret_string).revision

  gitops_workload_repo_secret_key = var.secret_name_git_data_workloads
  gitops_workload_repo_username = jsondecode(data.aws_secretsmanager_secret_version.git_data_version_workload.secret_string).username
  gitops_workload_repo_password = jsondecode(data.aws_secretsmanager_secret_version.git_data_version_workload.secret_string).password
}

