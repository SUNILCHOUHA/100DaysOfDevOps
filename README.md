🚀 Terraform Learning Journey (Day 01 – Day 12)

This repository documents my 12-day hands-on Terraform journey, where I progressed from Terraform fundamentals to deploying a production-style 3-tier AWS architecture with workspace-based environments and remote state management.

The goal of this journey was not just learning Terraform commands, but understanding real-world Infrastructure as Code (IaC) practices used by DevOps teams.

📅 Day 01 – Terraform Basics & Setup

What is Terraform and Infrastructure as Code

Installed Terraform CLI

Understood Terraform workflow:

init

plan

apply

destroy

First Terraform configuration file

📅 Day 02 – Providers & Resources

AWS provider configuration

Understanding providers, resources, and arguments

Created first AWS resource using Terraform

Learned how Terraform interacts with AWS APIs

📅 Day 03 – Variables & Outputs

Declared input variables

Used terraform.tfvars

Defined output values

Improved reusability and readability of Terraform code

📅 Day 04 – State File & Terraform State

What is terraform.tfstate

Why Terraform state is important

How Terraform tracks infrastructure

Basic state commands:

terraform state list

terraform state show

📅 Day 05 – Simple Terraform Project

Built a simple EC2 project

Used variables, outputs, and tags

Validated Terraform lifecycle end-to-end

Understood how changes reflect in infrastructure

📅 Day 06 – Terraform Modules

What are modules and why they are needed

Created custom Terraform modules

Module inputs and outputs

Improved code reusability and structure

📅 Day 07 – Designing 3-Tier Architecture

Designed a production-style 3-tier AWS architecture

Web Tier

Application Tier

Database Tier

Planned networking flow:

Public → Private → Private

Focused on design before implementation

📅 Day 08 – VPC & Networking

Created custom VPC

Public and private subnets

Route tables and associations

Internet Gateway and NAT Gateway

Security group basics

📅 Day 09 – Load Balancer & Compute Layer

Application Load Balancer (ALB)

Target Groups and listeners

EC2 Launch Templates

Auto Scaling Group (ASG)

NGINX setup on EC2 instances

📅 Day 10 – Workspace-Based Environments

Terraform workspaces concept

Created environments:

dev

stg

prod

Used terraform.workspace for environment-specific logic

Deployed same code to multiple isolated environments

📅 Day 11 – Remote State Management

Why local state is not enough

Configured S3 backend for Terraform state

Enabled DynamoDB state locking

Prevented state conflicts and ensured safe deployments

📅 Day 12 – Final Deployment & Validation

Successfully deployed:

DEV

STAGING

PRODUCTION

Verified applications via separate ALB endpoints

Debugged real-world issues:

Launch Template errors

ASG failures

Key Pair workspace isolation

Achieved a production-ready Terraform setup

🧠 Key Learnings

Infrastructure should be designed before implemented

Terraform workspaces provide true environment isolation

Remote state is mandatory for production

Debugging errors is a critical DevOps skill

Same Terraform code can manage multiple environments reliably

🛠 Tools & Technologies Used

Terraform

AWS (VPC, EC2, ALB, ASG, RDS, S3, DynamoDB)

NGINX

Git & GitHub

🎯 Next Steps

Integrate CI/CD using GitHub Actions + Terraform

Add HTTPS (ACM + ALB)

Improve security using AWS SSM Session Manager

🙏 Acknowledgements

Special thanks to Shubham Londhe Sir and the #TrainWithShubham community for guidance, mentorship, and motivation throughout this journey.

📌 This repository represents my transition from Terraform basics to real-world DevOps infrastructure practices.

#Terraform #AWS #DevOps #InfrastructureAsCode #100DaysOfDevOps
