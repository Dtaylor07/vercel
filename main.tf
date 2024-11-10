data "vercel_project" "frontend-project" {
  name = "frontend"
}

# Outputs prj_xxxxxx
output "project_id" {
  value = data.vercel_project.frontend-project.id
}


resource "vercel_firewall_config" "ip-blocking" {
  project_id = data.vercel_project.frontend-project.id

  rules {

    rule {
      name        = "Geolocation Rule"
      description = "Restrict access from certain countries"
      # multiple conditions in a single condition group are evaluated as ANDs
      condition_group = [{
        conditions = [{
          type  = "geo_country"
          op    = "eq"
          value = "SY"
          },
          {
            type  = "geo_country"
            op    = "eq"
            value = "BL"
        }]
      }]
      action = {
        action = "block"
      }
    }

    #   ip_rules {
    #     # deny this subnet for all my hosts
    #     rule {
    #       action   = "deny"
    #       ip       = "51.85.1.0/16"
    #       hostname = "example.com"
    #     }

    #     # rule {
    #     #   action = "challenge"
    #     #   ip = "1.2.3.4"
    #     #   hostname = "example.com"
    #     # }
    #   }
  }
}