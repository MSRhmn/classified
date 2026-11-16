# SAA-C03: Databases, Analytics, and Machine Learning

## Databases

### RDS

- SQL Server, Oracle, MySQL, PostgreSQL, MariaDB and Amazon Aurora are RDS type database.
- RDS is for OLTP works. Great for processing small transactions, like customer orders, banking transactions, payments and booking systems.
- Not suitable for OLAP. Use Redshift for data warehousing and OLAP tasks. Like analyzing large amount of data, reporting and sales forecasting.

#### Multi-AZ

- An exact copy of production database in another Availability Zone.
- Used for disaster recovery.
- In the event of a failure, RDS will automatically failover to the stand by instance.

#### Read Replica

- A read only copy of the primary database in the same AZ, cross-AZ or cross-region.
- Use to increase or scale read performance.
- Great for read-heavy workloads and takes the load off to primary database for read-only workloads (e.g., Business Intelligence reporting jobs).
- Automatic backup must be enabled in order to deploy a read replica.
- SQL Server, Oracle, MySQL, PostgreSQL, MariaDB allow upto 5 read replicas to each DB instance.

#### Amazon Aurora

- 2 copies of data in each availability zone, with a minimum of 3 availability zone which makes it 6 copies of data.
- 3 types of replicas available >> Aurora replicas, MySQL replicas and PostgreSQL replicas. Automated failover is only available with Aurora replicas.
- Aurora has automated backup turned-on by default. Snapshots can be taken with Aurora and share with other AWS accounts.
- Aurora serverless use for simple, cost effective option for infrequent intermittent or unpredictable workloads.

#### Dynamo DB

- Stored on SSD storage.
- Spread across 3 geographically distinct data centers.
- Eventually consistent reads (default). Consistency across all copies of data is reached within a second. Repeating a read after a short time should return the updated data. Best read performance.
- Strongly consistent reads. A strongly consistent read returns a result that reflects all writes that received a successful repsonse prior to the end.

##### Dynamo DB Transactions

- ACID requirement is the task for Dynamo DB Transactions.
- Dynamo DB Transactions provide developers atomocity, consistency, isolation and durability (ACID) across 1 or more tables within a single AWS account and region.
- All-or-nothing transactions.

##### On-demand Backup and Restore

- Full backups at any time.
- Zero impact on table performance or availability.
- Consistent within seconds and retained until deleted.
- Operates within same region as the source table.

##### Point-in-time Recovery (PITR)

- Protects against accidental writes or deletes.
- Restore to any point in the last 35 days.
- Incremental backups.
- Not enabled by default.
- Latest restorable - 5 minutes in the past.

##### Dynamo DB Streams and Global Tables

- Managed multi-master and multi-region replication.
  - Globally distributed application.
  - based on Dynamo DB streams.
  - Multi-region redundency for disaster recovery or high availability.
  - No application re-writes.
  - Replication latency under 1 second.

#### Document DB

- Migrating Mongo DB from on-premises to AWS, use case will be Amazon Document DB.

#### AWS Keyspaces

- Migrating big data Cassandra cluster to AWS, use case will be AWS Keyspaces.

#### Neptune

- Migrating graph databases, use cases will be Neptune.

#### QLDB (Quantum Ledger Database)

- Migrating immutable database, use cases will be QLDB.

#### Timestream

- Store large amount of time-series data for analysis, use cases is Timestream.

## Big Data

### Redshift and EMR

- While Redshift is a relational database, It's not a replacement for RDS in traditional application.
- Redshift only support single-AZ deployments. Multiple clusters can be deployed in different AZs, but technically they are separate deployments. It's not highly available by default.
- EMR is made up of EC2 instances. This can employed with standard EC2 instance cost-saving measures.

### Kinesis, Athena and Glue

- Kinesis is the only service with a real time response, solutions to processing or moving data.
- SQS and Kinesis both can be Queues. SQS is easier and simpler and, Kinesis is faster and can store data up to a year.
- Serverless SQL means Athena. Quering data from S3 using SQL that is what Athena is.
- Glue is serverless ETL. It can help create Schema for data when paired with Athena.

### QickSight OpenSearch or ElasticSearch

- QuickSight is go-to tool for creating dashboard for visualizing data.
- OpenSearch is primarily used for analyzing log files and various documents, specially within an ETL process.
- Amazon OpenSearch and Amazon ElasticSearch are the same service.

### Data Pipeline

- It is a managed ETL service within AWS.
- Implement automated workflows for movement and transformation of data.
- It integrates with storage services (e.g., RDS, S3) and compute service (e.g., EC2, EMR).
- Data driven and task-independent workloads are a perfect use case.

### Amazon Managed Streaming for Apache Kafka (MSK)

- It is an AWS managed service for building and running Apache Kafka streaming applications
- This service handles control plane operations (creating, updating and deleting).
- User has to manage data plane operations.
- It pushes broker logs to CloudWatch, S3 or Kinesis Data Firehose.
- API calls are logged to CloudTrail.

## Machine Learning

### Amazon Comprehend

- Amazon Comprehend is a natural language processing (NLP) service that uses machine learning to find insights and relationships in text.
- Sentiment analysis, like someone is talking bad or good thing in social media.
- Uses for index and search product reviews.
- Legal brief management.
- Process of financial documents.

### Amazon Kendra

- Uses Machine Learning to build a intelligent search service to find unstructured text documents.

### Textract

- Use Textract to convert text, handwriting and data scanned documents to text.

### Amazon Forecast

- Analyze time-series data and make predictions based on that analysis, use case will be Amazon Forecast.

### Amazon Fraud Detector

- Fraud detection machine learning model that is highly customized based on provided data.

### Transcribe

- Transcribe uses machine learning to convert video and audio to text (e.g., generate closed captioning).

### Amazon Lex

- Building online chat bots use case will be Amazon Lex. This is the service that powers behind A-Lex-a.

### Amazon Polly

- Amazon Polly converts text to speech in multiple languages.

### Amazon Rekognition

- Content moderation using AI/ML, use case will be Amazon Rekognition. Deep learning-based visual analysis service. Search, verify, and organize millions of images and videos.

### Amazon SageMaker

- Ground Truth - Setup and manage labeling jobs for training datasets using active learning and human modeling.
- Notebook - Access a managed Jupyter Notebook environment.
- Training - Train and tune models.
- Inference - package and deploy machine learning model at scale.

#### Create Model

- This is the place which will provide predictions for the endpoint.

#### Create an Endpoint Configuration

- This is where to specify the model to use, inference instance type, instance count, variant name, and weight.
- This can sometimes be called a production variant.

#### Create an Endpoint

- This is where the model is published, and can be invoke the model using InvokeEndpoint() methdo.

#### Amazon SageMaker Neo

- Building custom algorithm using Tensorflow or Pytorch then upload it to Amazon SageMaker Neo to get optimized binary architecture.

- Elastic Inference to optimize cost using CPU based instance rather than GPU based instance.
- SageMaker supports automatic scaling and high availability.

### Translate

- Translating from one language to another using deep learning/neural networks, that's what Translate do.

## Media

### Elastic Transcoder

- Converting media files into an optimized format of a particular device, use case will be Elastic Transcode.

### Kinesis Video Stream

- Video streaming at scale from millions of devices (e.g., Ring), use case will be Kinesis Vidoe Stream.
