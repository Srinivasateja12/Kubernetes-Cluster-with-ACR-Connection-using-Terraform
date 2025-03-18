# Kubernetes Cluster with ACR Connection using Terraform

## Overview

This project provisions an Azure Kubernetes Service (AKS) cluster and an Azure Container Registry (ACR), and establishes a connection between them using Terraform. The entire infrastructure is defined using Terraform modules for better reusability and maintainability.

 - Infrastructure as Code (IaC): Automated provisioning using Terraform.

 - Resource Group: Creates a dedicated resource group for AKS and ACR.

 - Azure Kubernetes Service (AKS): Deploys a scalable Kubernetes cluster.

 - Azure Container Registry (ACR): Hosts container images securely.

 - AKS-ACR Integration: Assigns the AcrPull role to AKS, enabling it to pull images from ACR without requiring additional authentication.

 - Modular Design: Uses Terraform modules to structure the code efficiently.

## Architecture

Resource Group: A dedicated resource group to contain all resources.

Azure Container Registry (ACR): A private container registry for storing and managing container images.

Azure Kubernetes Service (AKS): A managed Kubernetes cluster to deploy and run containerized applications.

AKS & ACR Connection: AKS is granted the AcrPull role to pull images from ACR seamlessly.

## Prerequisites

Before running this Terraform configuration, ensure you have:

Terraform installed (Download Terraform)

Azure CLI installed (Install Azure CLI)

Authenticated Azure CLI session (az login)

An active Azure subscription

## Deployment Steps

### 1. Clone the Repository

> git clone https://github.com/Srinivasateja12/Kubernetes-Cluster-with-ACR-Connection-using-Terraform.git
 cd Kubernetes-Cluster-with-ACR-Connection-using-Terraform

### 2. Initialize Terraform

> terraform init

### 3. Plan the Deployment

> terraform plan

This step shows the resources Terraform will create before applying changes.

### 4. Apply the Deployment

> terraform apply -auto-approve

Terraform will provision the AKS cluster, ACR, and establish their connection.

### 5. Verify Deployment

After deployment, confirm the resources in Azure:

> az aks list --output table
> az acr list --output table

To verify AKS has access to ACR:

> az role assignment list --assignee $(az aks show --resource-group <resource-group> --name <aks-cluster> --query "identity.principalId" --output tsv)

Destroying the Infrastructure

To delete all resources created by Terraform:
> terraform destroy -auto-approve
