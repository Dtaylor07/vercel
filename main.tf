data "vercel_project" "frontend-project" {
  name = "frontend"
}

# Outputs prj_xxxxxx
output "project_id" {
  value = data.vercel_project.frontend-project.id
}


resource "vercel_firewall_config" "ip-blocking" {
  project_id = data.vercel_project.frontend-project.id

  ip_rules {
    # deny this subnet for all my hosts
    rule {
      action = "deny"
      ip = "51.85.0.0/16"
      hostname ="example.com"
    }

    # rule {
    #   action = "challenge"
    #   ip = "1.2.3.4"
    #   hostname = "example.com"
    # }
  }
}