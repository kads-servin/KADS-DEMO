# Push a message into PubSub, Integrating the Terraform scripts in a Jenkins pipeline  


This module provides  the creation of a VPC and GCE, also it creates  SA with a custom role that has the minimum roles to read from PubSub and write into GCS (CloudStorage), and creates the PubSub Topic and suscription, a cron job is create which uses a gcloud command to read the PubSub messages, a cloud scheduler is create to publish a new messa to the PubSub topic every minute at Mexico City zone (CST).

## Compatibility

This module is meant for use with 
```Terraform v1.0.11``` 
And  
```provider registry.terraform.io/hashicorp/google v4.2.1```

## Limits

The Messagge will be in Mexico city time zone only (CST).
The machine type is a n2d-standard-2
The message will be publish every 1 minute



## Requirements
Before this module can be used on a project, you must ensure that the following pre-requisites are fulfilled:

   1.-Terraform need to be installed on the machine where Terraform is executed.

   2.-The Service Account you execute the module with has the right permissions.
      
      App Engine Admin
      App Engine Creator
      Cloud Scheduler Admin
      Compute Admin
      Compute Network Admin
      Project IAM admin
      Pub/Sub admin
      Service Account Admin

   3.-The APIs needs to be active on the project you will launch.

## Executing the project from Terraform

Please Follow the below commands

```python

# To get the plugins
terraform init

# To see the infrastructure plan
terraform plan

# To apply the infrastructure build
terraform apply
```
## Connect to GCP console

Move to Compute Engite to see your instance.

<img width="191" alt="Instance" src="https://user-images.githubusercontent.com/78040799/148826826-f853d620-e9e5-4c80-8f10-6027b3afb35b.PNG">

Move to Pub/Sub to see your Topic and Suscription.

Topic:
<img width="389" alt="Topic" src="https://user-images.githubusercontent.com/78040799/148826949-56528122-b73d-4200-80fa-0239565f9e6f.PNG">

Suscription:
<img width="311" alt="Suscription" src="https://user-images.githubusercontent.com/78040799/148827002-7fccf790-e57b-4f63-90a2-e7dade55dbd9.PNG">

Connect to your Cloud storage and move to the bucket where your message are alocated. 

<img width="821" alt="Bucket" src="https://user-images.githubusercontent.com/78040799/148826345-24c0f28d-a126-4158-b7b1-bcc523c2afc5.PNG">



# Author
|        Name       |
|-------------------|
|  Karen Dominguez  |

![DEMO-TASK-01](https://user-images.githubusercontent.com/78040799/148827265-4e4a11b3-ee80-4fc8-8a8b-6c187ac80950.PNG)
