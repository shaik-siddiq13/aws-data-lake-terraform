\# AWS Data Lake Infrastructure using Terraform



\## Project Overview



This project focuses on building an AWS Data Lake infrastructure using Terraform (Infrastructure as Code).



The objective is to automate the provisioning of AWS resources required for a scalable Data Lake architecture.



\## Architecture



The project follows a Medallion Architecture:



\- \*\*Bronze Layer:\*\* Stores raw data in Amazon S3.

\- \*\*Silver Layer:\*\* Stores cleaned and validated data.

\- \*\*Gold Layer:\*\* Stores business-ready data.



\## AWS Services



\- Amazon S3 – Data storage

\- AWS IAM – Identity and access management

\- AWS Glue Data Catalog – Metadata management

\- AWS Glue Crawler – Schema discovery

\- Amazon CloudWatch – Logging and monitoring



\## Technologies Used



\- Terraform

\- HashiCorp AWS Provider

\- Amazon Web Services

\- HCL (HashiCorp Configuration Language)

\- Git and GitHub



\## Project Structure



```text

aws-data-lake-terraform/

│

├── modules/

│   ├── s3/

│   ├── iam/

│   ├── cloudwatch/

│   ├── glue\_catalog/

│   └── glue\_crawler/

│

├── main.tf

├── providers.tf

├── variables.tf

├── outputs.tf

├── terraform.tfvars.example

├── .terraform.lock.hcl

└── .gitignore

```



\## Terraform Modules



| Module | Responsibility |

|---|---|

| S3 | Creates Bronze, Silver and Gold buckets |

| IAM | Configures AWS Glue permissions |

| CloudWatch | Creates a log group |

| Glue Catalog | Creates a metadata database |

| Glue Crawler | Discovers data in the Bronze bucket |



\## Prerequisites



\- Terraform CLI

\- AWS CLI

\- AWS account with authorized permissions

\- Git



\## Configuration



Clone the repository and initialize Terraform:



```bash

git clone <repository-url>

cd aws-data-lake-terraform

terraform init

```



Create your own variable configuration:



```bash

copy terraform.tfvars.example terraform.tfvars

```



Update the bucket suffix with a globally unique value.



\## Validation



Format and validate the Terraform configuration:



```bash

terraform fmt -recursive

terraform validate

```



Review the execution plan before deployment:



```bash

terraform plan

```



Deploy only after reviewing the plan and confirming AWS permissions and billing approval:



```bash

terraform apply

```



\## Cleanup



When the infrastructure is no longer required, review the resources and destroy them using:



```bash

terraform destroy

```



Ensure S3 buckets are empty before destroying them.



\## Project Status



\- \[x] Terraform project structure

\- \[x] Modular S3 infrastructure

\- \[x] IAM configuration

\- \[x] CloudWatch log group

\- \[x] Glue Data Catalog

\- \[x] Glue Crawler configuration

\- \[x] Terraform formatting and validation

\- \[ ] GitHub repository publication

\- \[ ] AWS infrastructure deployment

\- \[ ] Data processing pipeline implementation



\## Author



Data Engineering | AWS | Terraform | Python | SQL | PySpark



