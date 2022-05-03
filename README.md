# GCP-POC
gcp-pocs
Patch & Config management using VM Manager

# Main.tf
Contains source code of google_compute_instance
defined as::
default network,
test metadat,
Service Account ##{"Change it according to your service account"}

# os-config.tf
Contains policies to cofigure vm
defined as::
policy-1: Installing Node.js i.e "ENFORCEMENT" mode
    {
        Status: compliant
    }
policy-2: Installing stackdriver-agent i.e "ENFORCEMENT" mode
    {
        Status: non-compliant
            {
                reason: Enforce state: resource "install-pkg-stack-driver" error: error installing apt
            }
    }

# variable.tf
contains looping construct of 'count' used in gce-instance main.tf
defined as:
type: number # data type
description: message
default: no. of instances to be created

# provider.tf
contains source code to install requires dependencies 