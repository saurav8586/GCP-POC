resource "google_os_config_os_policy_assignment" "primary" {
  instance_filter {
    all = true
  }

  location = "us-east1-b"
  name     = "assignment"

  os_policies {
    id   = "setup-repo-and-install-package-policy-final-2"
    mode = "ENFORCEMENT"

    resource_groups {
      resources {
        id = "install-pkg-node"

        pkg {
          desired_state = "INSTALLED"

          apt {
            name = "nodejs"
          }
        }
      }

    }

    #allow_no_resource_group_match = false
    #description                   = "A test os policy"
  }

os_policies {
    id   = "setup-repo-and-install-package-policy-final-4"
    mode = "ENFORCEMENT"
    resource_groups {
      resources {
        id = "install-pkg-stack-driver"

        pkg{
          desired_state = "INSTALLED"

          apt {
            name = "stackdriver-agent"
          }
        }
      }
    }
  }
  
  rollout {
    disruption_budget {
      percent = 1
    }

    min_wait_duration = "3.5s"
  }

  description = "A test os policy assignment"
}