provider "google" {
    credentials = file("credentials.json")
    project = "long-advice-346606"
    region = "us-east1-b"
}

