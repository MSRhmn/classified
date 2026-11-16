# SAA-C03: Identity, Security, and Governance

## IAM(Identity and Access Management)

- IAM is a Global Service.
- Groups only contains users, not other groups.
- ARN stands for amazon resource name.
- Always give users minimum amount of access required to do their jobs.
- Create groups and attach them to users, this is the best practice.

### Roles

- Role is an identity in IAM that has specific permissions.
- Roles are temporary which is preferred option for security purpose.
- Roles provide access without the access key IDs and secret access keys by attaching it to ec2. This is the preferred method.
- Policies control a role's permissions.

## Security

### DDoS

- A Distributed Denial of Service attack attemps to make webiste or application unavailable to end users.
- Commond DDoS Layer 4 attacks are SYN floods or NTP amplification attacks.
- Commond Layer 7 attacks include floods to GET/POST requests.

### CloudTrail

- CloudTrail is the CCTV for a AWS account. It logs API calls made to AWS account and stores in S3.

### Shield

- Shield protects against layer 3 and layer 4 DDoS attacks only.
- Advance Shield costs 3000 USD per month. But it give dedicated 24/7 DDoS response team.

### WAF

- WAF (Web Application Firewall) protects against layer 7 DDoS attacks as well as SQL injections and cross-site scripting.
- Blocking specific countries or IPs can be achieved by AWS WAF.

### Firewall Manager

- Multiple AWS accounts and resources that need to be secured centrally.

### GuardDuty

- Uses AI to learn what normal behavior looks like in AWS account and alerts any abnormal or malicious behavior.
- Updates a database of knows malicious domains using external feeds from third parties.
- Monitors CloudTrail logs, VPC Flow logs and DNS logs.
- Findings appear in GuardDuty dashboard. Amazon EventBridge can be use to trigger a Lambda function to address a threat.

### Macie

- Macie uses AI to analyze data in S3 and helps identify PII, PHI, and financial data.
- Great for HIPPA and GDPR compliance as well as preventing identity theft.
- Macie alerts can be sent to Amazon EventBridge and integrate with event management systems.
- Automate remediation actions using other AWS services, such as Step Functions.

### Inspector

- It use to perform vulnerability scans on both EC2 instances and VPCs.
- These are called host assessments on EC2 and network assessments on VPCs.
- Assessments can be run once, or alternatively weekly.

### KMS and CloudHSM

#### AWS KMS

- KMS is a managed service, makes it easy to create and control encryption keys that is use to encrypt data.
- The service starts by requesting creation of CMK. Users control the lifecyle of the CMK as well as who can use or manage it.
- Shared tenancy of underlying hardware.
- Has ability to automatic key rotation.
- Automatic key generation.

##### CMK

- 3 ways to generate CMKs. AWS creates the CMK for the user. The key material for a CMK is generated within hardware security modules (HSMs) managed by AWS KMS.
- Import key material from user, own key management infraustructure and associate with a CMK.
- Key material generated and used in an AWS CloudHSM cluster as the custom key store feature in AWS KMS.

##### Permissions

- Use the key policy. Controlling access this way means the full scope of access to the CMK is define in a single document (the key policy).
- Use IAM policies combination with key policies. Controlling access this way enables to manage all the permissions for IAM identities in IAM.
- Use grants in combination with the key policy. Controlling access this way enables to access to the CMK in the key policy, as well as users to delegate their access to others.

#### CloudHSM

- It is a dedicated HSM.
- Full control over underlying hardware.
- Full control of users, groups, keys.
- No automatic key rotation.

### Secrets Manager

- Secrets manager are used for storing application secrets such as database credentials, API keys, SSH keys, passwords etc.
- Applications use the secret manager API.
- Rotating credentials is easy but when enabled secrets manager will rotate credentials immediately.
- Making sure that all the application are configured to use secrets manager before enabling credential rotation.

### Parameter Store

- For minimizing cost choose Parameter Store over Secrets Manager.
- If there is need more than 10,000 parameters, key rotation or ability to generate passwords using CloudFormation then use case will be Secrets Manager.

### Presigned URLs

- Use to share files from private bucket in S3.

### Advanced IAM Policies

- Not explicitly allowed == implicitly denied.
- Explicitly deny > everything else.
- Only attach policies has effect.
- AWS joins all applicable polices and Explicitly deny always wins.
- Policies are AWS managed and customer managed.

### AWS Certificate Manager

- AWS Certificate Manager integrates with Elastic Load Balancing, CloudFront and API Gateway.
- AWS Certificates Manager is free service that saves money and time. Automatically renews new SSL certificates and rotate the old certificates with supported AWS services.

### Audit Manager

- Continuous audting or automating auditing reports about HIPAA or GDPR compliance.

### Artifact

- Used for audit of the compliance report.

### Cognito

- User pool is a directories that provides sign-up and sign-in features of application.
- Identity pool allows users to access other AWS services.
- Identity pool and Users pool can be used seperately or together.

### Amazon Detective

- Amazon Detective operates accross multiple AWS services and analyze the root cause of an event.

### Network Firewall

- Filtering network traffic before it reaches to internet gateway or requires intrusion prevention systems or any hardware firewall requirements.

### Security Hub

- Single place to view all security alerts across multiple AWS security services and AWS accounts.

## Governance

### Organizations

- Service Control Policies (SCPs) has the ultimate say as to whether an API call goes through. They are the only way to restrict what root account can do.
- Centralized logs are always the right answer. CloudTrail offers support to log everything into a single AWS account.
- Isolating workloads into separate account is a great way to add more layers of security and controls. Avoid answers that lump everything together.

#### AWS Config

- Standardization, Any time a "rule" need to be set up for an account, using Config to check for the compliance.
- Automate the Response, Config offers automatically remidiate problems using Automation documents or triggering a Lambda function.
- Know What Changed, Config is the one-stop-shop to see what changed. It will provide a history of all of the architecture.

#### Authentication

- User management requires right tool. AWS SSO/IAM Identity Center for internal user management and Cognito for external user management.
- Active Directory is a Microsofts Directory service. If it is in the cloud then use case is Managed Microsoft AD. For on-premise AD's use case will be AD Connector.
- Cross-account Role access is always better solution than creating unnecessary IAM credentials.

#### AWS Cost Management

- AWS Cost Management best practice is to using combination of Cost Explorer, AWS Budgets and tags.
- Get ahead of problems by creating proactive alerts. When users get to the 80% threshold, telling someone via SNS.
- Automating the response. Spending too much money? Shutting down some services. Always deciding how to remove the human interaction.
- Detailed reports and exploring costs. This questions will usually involve AWS Cost and Usage Reports or Cost Explorer for in-depth reporting purposes.
- Use AWS Compute Optimizer to generate recommendation on implementing more accurate compute sizes based on actual needs.

#### Trusted Advisor

- It's free but need a business or enterprise support plan to get most useful checks.
- There are limits to trusted advisor. It's strictly auditing tool and it will not solve the problems by itself.
- Autmote the response. Using EventBridge to kick off a lambda function to solve the problem.

#### Account and Licenses

- AWS Control Tower can be use to implement compliance and account governance within multi-account environments using automated account setup.
- Leverage Preventive and Detective guardrails within AWS Control Tower. They are implemented via SCPs and AWS Config respectively.
- AWS License Manager provides a simplified way to manage licenses from supported vendors to prevent license abuse and overcharges. It works on AWS and on-premises.

#### Infrastructure and Deployments

- AWS Service Catalog allows end users to provision pre-approved products and services via shared catalog portfolios. These catalogs are written in CloudFormation.
- AWS Proton can empower developers to automate the provisioning of their entire application stack for container-based or serverless architecture.

#### AWS Well-Architected Tool

- Use case of AWS Well-Architected Tool to document architectural decisions and their measurements against well-stablished AWS industry  best practices.

#### AWS Health

- AWS Health is a dashboard and service meant to provide notifications of both public and account-specific events within AWS.
- Questions about service alerts or notifications of EC2 hardware maintainance reboots will leverage AWS Health in some manner. Can be automated with EvenBridge and kick-off lambda functions.
