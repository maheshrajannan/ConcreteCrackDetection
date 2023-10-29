provider "google" {
  credentials = file("./helm-key.json") # Replace with your Google Cloud credentials file
  project     = "concrete-detection-2"                      # Replace with your GCP project ID
  region      = "us-central1"                          # Replace with your desired region
}



resource "google_container_cluster" "crack-detection-cluster" {
  name     = "crack-detection-cluster"
  location = "us-central1-a"  # Replace with your desired zone
  initial_node_count = 2

  # Use the default VPC and subnet settings
  network            = "default"
  subnetwork         = "default"

  # Enable the GKE Autopilot mode
  release_channel {
    channel = "REGULAR"
  }
}

data "google_container_cluster" "crack-detection-cluster" {
  name     = google_container_cluster.crack-detection-cluster.name
  location = google_container_cluster.crack-detection-cluster.location
}

resource "google_compute_disk" "concrete-gce-nfs-disk" {
  name  = "concrete-gce-nfs-disk"
  size  = 20 # Size of the disk in gigabytes
  type  = "pd-standard" # You can change the disk type as needed
  zone  = "us-central1-a" # Zone where the disk will be created
}

resource "null_resource" "configure_kubectl" {
  # This triggers the provisioner after the GKE cluster is created.
  triggers = {
    cluster_id = google_container_cluster.crack-detection-cluster.id
  }

  # Use the local-exec provisioner to run the gcloud command.
  provisioner "local-exec" {
    command     = "gcloud container clusters get-credentials ${google_container_cluster.crack-detection-cluster.name} --zone ${google_container_cluster.crack-detection-cluster.location}"
    interpreter = ["bash", "-c"]
  }
}

output "cluster_name" {
  value = google_container_cluster.crack-detection-cluster.name
}

