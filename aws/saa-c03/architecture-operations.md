# SAA-C03: Architecture and Operations

## Monitoring

### CloudWatch

- CloudWatch is the main tool for anything alarm related.
- Not everything go through CloudWatch but AWS standard should be watched by AWS config.
- Standard metric is delivered every five minutes, while detail monitoring delivers data every one minute.

### Application Monitoring with CloudWatch Logs

- CloudWatch logs is the place for application logs. EC2, On-Premises, Lambda, RDS and CloudTrail all integrate with this service.
- SQL query on logs goes to CloudWatch Logs Insights.
- Realtime logs means Kinesis over CloudWatch.

### Visualizing Data and Monitoring at Scale

- Grafana might be best for visualization of container metrics. AWS managed service for correlation and visualization of container of IoT metrics, this might be best option.
- Monitoring container metrics at scale? The amazon managed service for Prometheus. Leverage this service for any Kubernetes-based metrics monitoring at scale. It can be amazon EKS cluster or self-managed cluster.
- Grafan and Prometheus both are AWS managed service. AWS handles scaling and high availability for the user.

## High Availability and Scaling

### High Availability

- Always keep in mind the highly available option for AWS services.
- Appropriate situation for horizontal and vertical scaling.
- Consider cost effectiveness.
- Switching database in AWS is more easier than on-premise.

### Auto Scaling

- Auto Scaling group is only for EC2. Other services might have built-in option. But they aren't included in Auto Scaling Groups.
- Get ahead of the workload. Whenever possible picking the solution as predictive rather than reactive.
- Bake AMIs to reduce build times. To avoid long provisioning times by putting everything in an AMI. This is better than using user data, whenever possible.
- Spread out. Making sure that auto scaling groups are spreaded out over multiple availabilty zones.
- Steady state groups allow to create a situation where the failure of a legacy codebase or resource that can not be scaled can automatically recover from failure.
- Elastic Load Balancers are essential for auto scaling groups. Making sure that health checks are on, otherwise instances won't be terminated or replaced when they fail health checks.

#### Database Scaling

- RDS has the most database scaling options.
- Horizontal scaling is usually preferred over vertical, can be reached by deploying read replica.
- Dynamo DB scaling comes down to accesss patterns like for predictable workload auto/provisioned scaling, when it comes to unpredictable workload On-demand will be the choice.

## Decoupling Workflows

### Amazon SQS

- SQS can duplicate messages. It is once in a while. So, if it is happening consistently, check for a misconfigured visibility timeout or if the developer failing to make the delete API call.
- Queues aren't bi-directional. If there is need to return communication to the instance that sent message, then there is need a second queue.
- Understanding the default values in SQS settings.
- Messages stored in SQS only persist up to 14 days.
- If message ordering is important then select SQS FIFO over the Standard.

#### Amazon SNS and API Gateway

- Email, text or any type of push-based notification that goes with  SNS service.
- CloudWatch alarm is a good option for SNS.
- Amazon API Gateway is a secure front door to external communication coming into the environment.

#### AWS Batch

- Batch workloads that is long-running > 15 minutes will be use case for AWS Batch.
- Workloads that are requiring queues, use case is AWS Batch.
- Alternative solutions for AWS lambda due to runtime requirements in that case AWS Batch is the suite.

#### Amazon MQ

- If there is require for managed broker service. Use case will be Amazon MQ.
- Rabbit MQ and Active MQ these two technologies goes with amazon MQ.
- Message protocols like JMS, AMQP 0-9-1, AMQP 1.0, MQTT, OpenWire or STOMP also goes with amazon MQ. SNS and SQS can not handle these message protocols.

#### AWS Step Functions

- Serverless orchestration service will involve AWS Step Functions.
- Whenever solutions requires different states or logic during workflows like condition checks, failure catches or specially wait periods then the use case will be AWS Step Functions.

#### Amazon AppFlow

- For architectures requiring simplified data ingestion from external SaaS applications into AWS, this is where amazon AppFlow comes in.
- Amazon AppFlow can be Bi-directional in some use cases. Data can be ingested in or out of AWS services depending on the configurations.

## Serverless Architecture

### AWS Lambda

- Talking about credentials and lambda, ensure to attaching role to the function.
- S3, Kinesis, EventBridge (CloudWatch Events) are commonly can trigger a lambda function.
- Can be allocated with max 10GB RAM and 15 minutes of runtime.
- Any AWS API call can be a trigger to kick off EventBridge/CloudWatch Events rule to perform AWS lambda, which can even trigger any EventBridge rule. This is faster than trying to scrape from CloudTrail.

### Container and Images

- Container management solution that runs in AWS and on-premise consider amazon EKS or EKS Anywhere.
- Fargate can't work alone. In order to use fargate there must be use of ECS or EKS. Fargate is not a service by itself.
- Containers are flexible. Containers can encompass just about any workload. Generally, it's preferred to use containers rather than EC2 on the exam.
- Container starts with a Dockerfile, build an image, upload it to a repo, and then run it on a host.
- Amazon ECR is the AWS-managed image registry. When AWS service needed for image storage or image vulnerability scanning.

### Amazon Aurora Serverless

- It is a on-demand or auto scaling database.
- Good for variable traffic or unknown workloads.
- Capacity planning for a new application with a database or development environment or a existing one. Use case will be Amazon Aurora Serverless.

### AWS X-Ray

- Used to gain application insights using requests and responses of services and functions at different point in a application flow.
- Traces and downstream response times are use case of AWS X-Ray.
- AWS X-Ray natively integrates with AWS Lambda or Amazon API Gateway insights and help understanding deeper insights of the workload requests and responses.

### AWS AppSync

- It is a AWS managed GraphQL interface for any frontend application or developer.

## Automation

### CloudFormation

- CloudFormation is an infrastructure as code (IaC) service that allows you to define and manage AWS resources and infrastructure using templates written in JSON or YAML format.
- CloudFormation enables to automate the creation, modification, and deletion of AWS infrastructure in a repeatable and consistent manner.
- Mapping and Parameter Store are useful to help make templates more flexible. Hardcoded IDs (e.g., AMI or Snapshot ID) are a source of breakage.

### Elastic Beanstalk

- Elastic Beanstalk is a Platform as a Service (PaaS) that simplifies the deployment and management of applications. It abstracts the underlying infrastructure and handles the provisioning and configuration of resources automatically.

### Systems Manager

- Automation documents are the primary use case of configure the inside of EC2 instances.

## Migration

### Migrating Data with AWS Snow Family

- Snowballs are perfect for moving many terabytes of data. Best use case of Snowball, where internet connection is slow also it is more secure.

### Storage Gateway

- Hybrid solution or on-premise storage will involve Storage Gateway.
- Out of space in local-network attached storgae, File Gateway will be perfect solution for that.
- Basically it's a VM which runs locally on-premises.

### DataSync and Transfer Family

- DataSync is a agent-based solution that excels at one-time migrations of file shares into AWS.
- EFS and FSx are both viable locations for DataSync to transfer content into.
- Transfer Family allows to use legacy file transfer protocols to give older applications the ability to read and write from S3.

### Migration Hub

- Migration Hub is a organizational tool which allows to organize all steps. Needs other tools to complete the migration though.
- Database Migration Service is go-to tool for any sort of database migration. It works for on-premise to cloud, or moving data between different RDS databases.
- Server Migration Service is a tool to migrate VMs data center to AWS.

### Application Discovery Service

- Quickly migrate entire application to the AWS.
- Agentless discovery can be used via OVA file deployment to vSphere.
- Agent-based discovery collects detailed information of VMs on both Linux and Windows OS.

### Application Migration Service (MGN)

- Automated lift-and-shift service for migrating infrastructure to AWS.
- Replicates source servers (e.g., VM, Physical, or Azure VM) into AWS for non-disruptive cutovers.
- Recover Time Objectives (RTO) is minutes, Recovery Point Objective (RPO) is sub-second.

## Front-End and Mobile

### AWS Amplify

- Tools for simplified front-end web and mobile development.
- Fullstack application hosted on AWS.
- Enable developers to focus on coding not the infrastructure.
- Supports frameworks like React, Angular, Vue; also static site generator Gatsby and Hugo.
- Amplify support server side rendering like Next.js while S3 cannot perform static site generating.

### Device Farm

- Automated or manual testing on physical, real phones or tablets use case will be Device Farm. Can be used with Android, IOS or other web applications.

### Amazon Pinpoint

- It enables to engage with customers with a large or small scale.
- Pinpoint is geared toward marketing teams, business users, and sometime developers too.
- Segments allow for targeted messages and audiences.
- Leverage machine learning models to predict future engagements.
