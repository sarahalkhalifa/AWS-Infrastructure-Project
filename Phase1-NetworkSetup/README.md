# Phase 1: Network Setup
This phase focuses on building a foundational Virtual Private Cloud (VPC) infrastructure in AWS, setting the stage for scalable, secure, and efficient cloud solutions.

## Overview
This phase involves designing and implementing a scalable and secure Virtual Private Cloud (VPC) infrastructure on AWS. The key components include:
- Public and private subnets.
- An Internet Gateway and a NAT Gateway.
- EC2 instances in both public and private subnets for testing communication and accessibility.

## Key AWS Services Used
- Amazon VPC
- Amazon EC2
- Internet Gateway
- NAT Gateway
- Route Tables
- AWS Systems Manager (Session Manager)

## Steps Taken
1. **VPC Creation**: Configured a VPC with a CIDR range of `10.0.0.0/16`.
2. **Subnet Design**:
   - Public Subnet: `10.0.0.0/24`.
   - Private Subnet: `10.0.2.0/23`.
3. **Route Table Configuration**:
   - Associated public subnet with an Internet Gateway.
   - Configured a NAT Gateway for private subnet internet access.
4. **Security Groups**: Created security groups to control inbound and outbound traffic.
5. **EC2 Deployment**:
   - Launched a web server in the public subnet.
   - Set up a private instance accessible via AWS Systems Manager.

## Outcome
- Successfully implemented a scalable and secure VPC infrastructure.
- Enabled public and private instance communication using appropriate networking and security configurations.
- Verified functionality by accessing a web server from the public instance and testing connectivity to the private instance using AWS Session Manager.

## Architecture Overview
The architecture includes:
- **Amazon VPC** with CIDR `10.0.0.0/16`.
- **Public Subnet**: `10.0.0.0/24`, connected to an Internet Gateway.
- **Private Subnet**: `10.0.2.0/23`, connected via a NAT Gateway.
- **Internet Gateway**: Enables public internet access.
- **NAT Gateway**: Secures private subnet internet access.
- **Route Tables**:
   - Public Route Table for public subnet.
   - Private Route Table for private subnet.
- **EC2 Instances**:
   - Public Instance: Hosts a web server.
   - Private Instance: Accessible through AWS Systems Manager.
- **Security Groups** for granular traffic control.
