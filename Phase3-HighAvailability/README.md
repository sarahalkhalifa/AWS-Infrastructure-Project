### **Phase 3: Configuring High Availability in Your Amazon VPC**

#### **Objective**
In this phase, the goal is to implement a highly available architecture in an Amazon Virtual Private Cloud (VPC) using the following components:
- **Elastic Load Balancing** for distributing traffic across multiple application instances.
- **Amazon EC2 Auto Scaling** for dynamic instance management.
- **Amazon Aurora DB** for database high availability and disaster recovery.
- **Redundant NAT Gateways** for internet connectivity across availability zones.

---

#### **Key Tasks**
1. **Inspect Existing Lab Environment**:
   - Reviewed VPC configuration, including public and private subnets, NAT gateway, security groups, and routing.
   - Verified the inventory application setup on an EC2 instance and database.

2. **Create a Launch Template**:
   - Defined parameters to deploy EC2 instances, including Amazon Machine Image (AMI), instance type, security group, and user data.

3. **Set Up Auto Scaling Group**:
   - Created an Auto Scaling group to maintain at least two instances across two availability zones.
   - Registered instances with the existing Application Load Balancer for traffic distribution.

4. **Test Application High Availability**:
   - Deregistered the original EC2 instance from the load balancer.
   - Verified traffic distribution and failover between Auto Scaling instances.

5. **Configure Database High Availability**:
   - Added a read replica in a different availability zone for the Aurora DB cluster.
   - Performed a failover to the read replica to ensure database availability.

6. **Add Redundant NAT Gateway**:
   - Launched a second NAT gateway in a different availability zone.
   - Updated the route table to route internet-bound traffic through the new NAT gateway.

---

#### **Final Architecture**
The final architecture includes:
- **EC2 Auto Scaling Group**:
  - Ensures application availability by dynamically adjusting the number of instances.
- **Application Load Balancer**:
  - Distributes traffic across instances in private subnets.
- **Aurora DB Cluster**:
  - Highly available with read replicas for disaster recovery.
- **Redundant NAT Gateways**:
  - Maintains internet connectivity even during an availability zone failure.

---

#### **Outcomes**
- Implemented a fault-tolerant and highly available architecture.
- Verified high availability for both application and database tiers.
- Ensured internet connectivity redundancy for private subnets.
