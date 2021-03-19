# Migrating Jenkins to EC2 with Terraform

The contents of the following repo contain the steps outlined in this article. You will find the files for provisioning Jenkins on AWS via Terraform

You also have a basic Docker file want to test your Jenkins configuartion locally.

## Prerequisites 
- AWS Account and CLI installed
- Terraform Installed
- SSH access to the server that you are migrating from
- Terminal Access (either iTerm or within VS Code, or other chosen method)

## Quickstart

Make sure you are logged into AWS first and then run the following:
`terraform init`
`terraform plan`
`terraform apply -auto-approve`

Once you have it up and running you can use it as it is for Jenkins from the get go by navigating to the IP address provided in the Terraform Output with the addition of the port :8080. If you are using it purely for this then you can remove iam.tf, s3.tf and the following line from compute.tf - `iam_instance_profile = aws_iam_instance_profile.jenkins-s3-role.name`



### TODO
- Add ALB
- Add DNS