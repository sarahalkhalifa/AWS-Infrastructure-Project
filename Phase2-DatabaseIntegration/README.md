# Phase 2: Database Integration

Implementation of a relational database layer with Amazon RDS and integration with an Application Load Balancer (ALB) for a multi-tier architecture.

## Overview
This phase focuses on building a scalable and secure database layer within the AWS infrastructure. Amazon RDS is used to manage the relational database, and an Application Load Balancer (ALB) ensures high availability and load distribution across EC2 instances.

## Key AWS Services Used
- Amazon RDS (Aurora MySQL-Compatible)
- Amazon EC2
- Amazon VPC
- Application Load Balancer (ALB)
- AWS Systems Manager (Session Manager)

## Steps Taken
1. **Created an RDS Database**:
   - Engine: Aurora MySQL-Compatible.
   - Cluster identifier: `aurora`.
   - Credentials: Configured a secure master username and password.
   - Subnets: Launched in private subnets for enhanced security.

2. **Configured the Application Load Balancer**:
   - Target group: Registered EC2 instances to the ALB.
   - Listener: Configured HTTP listener for traffic routing.

3. **Tested Application Connectivity**:
   - Verified database connectivity through the ALB by accessing the application hosted on the EC2 instance.

4. **Optional Task**: Created a Cross-Region Read Replica.
   - Improved disaster recovery and scalability by replicating the database to a different AWS region.

## Outcome
- Successfully implemented a database layer using Amazon RDS.
- Integrated the database with the application layer through an Application Load Balancer.
- Enhanced scalability and reliability by setting up a cross-region read replica.

## Architecture Overview
The database layer architecture includes:
- **Amazon RDS**:
  - Primary cluster: Hosts the main database for application data.
  - Cross-region read replica: Ensures disaster recovery and low-latency reads in a secondary region.
- **Application Load Balancer**:
  - Distributes incoming traffic across EC2 instances.
  - Acts as the interface between the database and application layer.
- **Amazon EC2 Instances**:
  - Public Instance: Accessed via the ALB for application testing.
  - Private Instance: Communicates with the database securely.

## Key Insights
- **Cross-Region Read Replica**: AWS automatically creates necessary VPC components in the destination region to simplify setup.
- **Secure Database Layer**: Placing the RDS instance in private subnets ensures it is not directly exposed to the internet.
- **Load Balancing**: The ALB efficiently handles traffic, ensuring high availability and fault tolerance.

