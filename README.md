### Multi-Environment CD Pipelines with AWS CodePipeline and OS Tools

In this post, we will show how to deploy AWS infrastructure to multiple AWS accounts using open source tools and following best practices. We will explain a clear, simple, and repeatable deployment pipeline that can be used throughout multiple environments. The project we will create in this post will address a situation in which the customer needs to deploy an application to AWS into development, QA, and production environments. In addition in explaining how to configure the deployment pipeline, we will also cover how to arrange the AWS CloudFormation (https://aws.amazon.com/cloudformation/) templates by function so that they can be deployed as a cohesive application stack.



### Motivation

A common scenario AWS customers face is how to automate their infrastructure deployments on AWS. Customers need to create a secure, agile workflow that deploys to the cloud and uses their preferred AWS services. Also, customers need a reliable, supportable deployment pattern driven by automated workflows that are not overly complex and difficult to manage. Customer organizations frequently seek the ability to hand off elements of their deployment patterns to different teams in their organizations. These requirements may seem daunting to these teams because they need time and training to get up-to-speed the on the technology they are being asked to support.

In this post, we will demonstrate how to reduce complexity and increase agility by creating a workflow geared toward operational support teams. By using this simplified deployment pattern, engineering teams will not be tied to supporting this solution. Rather, this solution can be used and supported by engineers and operational support folks throughout an organization. We also will show how to deploy AWS infrastructure to multiple AWS accounts using open source tools and following best practices. We will explain how to build a repeatable deployment pipeline that can be used throughout multiple environments.


### Tech/framework used
```
The services that will be deployed with this post include:
  - AWS Managed Microsoft AD
  - EC2
  - S3
  - IAM
  - KMS
  - CloudTrail
  - Systems Manager Parameter Store
```
### Features
```
This post contains the following directory structure:
- codepipeline - where the of the CodePipeline configuration lives
- inspec_tests - where the InSpec configuration and tests live
- stacker - where the Stacker configuration lives
- templates - where all of the CloudFormation Templates are located

The post contains the following CloudFormation Templates:
- cloudtrail.yaml - creates the CloudTrail logs and send sends them to S3 Bucket
- ec2-instance-template.yaml - contains EC2 Instance, Instance Profile, and Security Group
- endpoints.yaml - contains the NLB, Security Group, and VPC Endpoint Service
- kms.yaml - contains the KMS Key configuration
- managedAD.yml - contains all of the Managed AD configuration
- s3-bucket-template.yaml - contains the S3 Bucket and S3 Bucket Policy
- vpc.yaml - contains 2 private subnets, route tables, and all VPC Endpoints used to communicate to AWS Services
```
### How to use?
```
To deploy this project follow the step by step instructions found here.
```

### Security
```
See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.
```

### Security
```
See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.
```

### License
```
This library is licensed under the MIT-0 License. See the LICENSE file.
```
