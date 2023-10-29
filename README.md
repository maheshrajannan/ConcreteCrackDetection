<img src="https://avatars2.githubusercontent.com/u/2810941?v=3&s=10000" alt="Google Cloud Platform logo" title="Google Cloud Platform" align="right" height="150" width="150"/>

# Concrete Crack Detection Through a 3 Part Application

   *This application has 3 components. It analyses uploaded concrete photos to find cracks. This is implemented and deployed locally first, then to GCLoud. We will do all of this in a hands on manner.*

## At a Glance

In this repository we will use an application that has 3 components to demonstrate `detecting cracks in concrete`.

   1. The first component is a web application that does `image upload`. It is written in react js.

   2. A Python application component that finds the crack in the uploaded image.

   3. The third application component is a node Js web app. It displays raw concrete images and their corresponding analyzed images with cracks in gallery format.

   4. There isn't a lot of technical jargon.

   5. The main focus is to quick start with a running app.

## Objective

The objective is,

   1. Ensure that app is running locally.

   2. Deploy the app locally.

   3. Containerize it.

   4. Then move to GCP on the cloud.

The purpose is NOT,

   1. Learning Kubernetes or Docker in depth.

   2. Learning a specific method or concept.

   3. Advanced Learning.


## Background

   Before starting a running app, let's first make sure we understand the background.

## Project Overview

   Let's see the entire infrastructure(gcloud components) in a single diagram.

   ![Crack Detection Diagram](/docScreenshots/concreteCrackDetectionDiagram.png)

> **Note**
> : Some information ommited for simplicity.

## Running the application

   Let's run each application component one at a time.

### GKE cluster and Persistent Disk creation

   This is created through Terraform.

### NFS server and volume creation

   This is created through Terraform.

### Let us USE helm chart to launch 3 components of application

   **Step-1** As a result, we have also created a `clusterPd`, `NFS server`, and `pvPvc`.

   **Step-2** Let us run `3 components of application` that are ready to launch.

   Let see 3 components of application in below diagram.

   ![3 components of web application](/docScreenshots/3components.png)

   **Step-3** There are 3 components that are all connected to the same `PVC`.

   **Step-4** Three components have the following 5 folders. 

   1) **app** :- Inside this folder we will get the set of instructions for building a specific component, along with a `dockerfile`.

   2) **gKE** :- Inside this folder we will get `shell script` to run specific components.

   3) **logs** :- Inside this folder we will get `logs` of the app when it creates a `docker image` and pushing it on dockerhub.

   4) **resourceManifests** :- Inside this folder we will get `YAML` files for deployment and services of gcloud.

## How to Run

Running it is as simple as 1 ... 2 ... 3

1. Configure Infra , the volume

   ![GCloud configure](/docScreenshots/gcloud-1.png)
   ![GCloud configure](/docScreenshots/Configure-1.png)
   ![GCloud configure](/docScreenshots/Configure-2.png)

2. Install the 3 part app through helm.

   ![Run The app](/docScreenshots/helm-1.png)
   ![Run The app](/docScreenshots/helm-2.png)

3. Run it.  

   ![Upload](/docScreenshots/app-1.png)
   ![Gallery](/docScreenshots/app-2.png)


## Thank you... :)
