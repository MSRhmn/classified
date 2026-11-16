# SAA-C03: Networking

## VPC

- VPC is a logical data center in AWS.
- Consists of internet gateways (virtual private gateways), route tables, network access control lists, subnets and security groups.
- 1 subnet is always in 1 availability zone.

### NAT Gateways

- A highly available, managed Network Address Translation (NAT) service that instances in private subnets can use to connect to services in other VPCs, on-premises networks, or the internet.
- Redundent inside the availability zone.
- Starts at 5 Gbps and scales currently to 45 Gbps.
- No need to patch.
- Not associate with security groups.
- Automatically assigned a public IP address.
- If there is resources in multiple availability zone and they share a NAT gateway. In the event NAT gateways zone is down, resource in other availability zone will lose internet access.
- To create a availability zone-independent architecture, create NAT gateway in each availability zone and configure routing to ensure resources use the NAT gateway in the same availability zone.

#### Network ACLs

- VPC automatically comes with a default network ACL, by default it allows all inbound and outbound traffic.
- By default custom network ACLs denies all inbound and outbound traffic untill rules are added.
- Each subnet in VPC must be associated with a network ACL. If not explicitly associated with a network ACL, the subnet will automatically associate with the default netowork ACL.
- IP addresses are blocked by the network ACL not security groups.
- Network ACLs can be associate with multiple subnets; however, a subnet can be associated with a only 1 ACL at a time. When a new network ACL attached to a subnet the previous association is removed.
- Network ACLs are numbered list of rules that are evaluated in order, starting with the lowest numbered rule.
- Netwrok ACLs have separate inbound and outbound rules and each rule can either allow or deny traffic.
- Network ACLs are stateless; responses to allowed inbound traffic are subject to the rules for the outbound traffic (and vice versa).

#### VPC Endpoints

- AWS VPC (Virtual Private Cloud) endpoints allow you to privately connect your Amazon Virtual Private Cloud to other AWS services without requiring internet access. They provide secure and efficient communication between your VPC and AWS services, improving security, performance, and compliance.
- Use cases will be AWS services without leaving the amazon internal network.
- 2 types of VPC Endpoints, interface endpoints and gateway endpoints.
- Gateways endpoints only supports S3 and DynamoDB.

#### VPC Peering

- Allows 1 VPC to connect another via direct network route using private IP addresses.
- Transitive peering is not supported. This must always be in a hub-and-spoke model.
- Peer between regions is available.
- No overlapping CIDR address ranges.

#### AWS PrivateLink

- Peering VPCs to tens, hundreds or thousands of customer VPCs.
- Doesn't require VPC peering; no route tables, NAT Gateways, Internet Gateways etc.
- Requires Network Load balancer on Service VPC and ENI on the customer VPC.

#### AWS VPN CloudHub

- If there is multiple sites, each with its own VPN connection. AWS VPN CloudHub can be use to connect those sites together. It's similar to VPC peering in that it works on a hub-and-spoke model.
- AWS VPN CloudHub is low cost and easy to manage. Though it operates over the public internet. All traffic between the customer gateway and AWS VPN CloudHub is encrypted.

#### Direct Connect

- Direct Connect directly connects data centers to AWS.
- Useful for high-throughput workloads (e.g., lots of network traffic)
- Helpful when need a stable and reliable secure connection.

#### Transit Gateway

- In use of Transit Gateway route tables can be use to limit how VPCs talk one to another.
- Works with Direct Connect as well as VPN connections.
- Supports IP multicast (not supported by any other AWS services).

#### AWS Wavelength

- 5G increasing application speeds at the edge using mobile networks.

## Route 53

- CName records cannot be used with root level domain aka naked domain. Given the choice alwasy choose alias record over CName.
- EC2 DNS name cannot be use to create alias record.
- Commond DNS record types - SOA record, CName record, NS record, A record.
- Domain names can be bought directly with AWS. It can take upto 3 days to register depending on the circumstances.
- 7 available routing policies with Route 53. Simple, Weighted, Failover, Geolocation, Geoproximity, Latency and Multivalue Routing Policy.

### Health Checks

- Health checks can be attached with individual record sets.
- If a record set fails health check, it will be removed from Route 53 untill it passes the health check.
- SNS notification can be applied to alert about failed health checks.

### Simple Routing Policy

- With simple routing policy, one record with multiple IP addresses. If multiple values are specified in the record, Route 53 returns all values to the user in a random order.

### Weighted Routing Policy

- Certain amount of traffic into a individual region with percent, that is where weighted routing policy comes in.

### Latency Routing Policy

- Depending on the latency on client-server user will send to the lowest latency region.

### Failover Routing Policy

- If active site fails then Route 53 automaticlly sends user to the passive site.

### Geolocation routing policy

- Route traffic based on the location of the users. Geolocation routing sends clients to the specific region.

### Geoproximity routing policy

- Lets Route 53 traffic route to resources based on the geographic location of the users and resources.
- Optionally choose to route more traffic or less to a given resource by specifying a value, knows as a bias.
- To use geoproximity routing, will have to use route 53 "tarffic flow".

### Multivalue answer routing policy

- Mutltiple records with multiple IP addresses with health check option. redirects users to healthy location if any location is unhealthy.

## Elastic Load Balancers

### Application Load Balancers (Network Layer 7)

- A listener checks for connection requests from clients, using the protocol and port that is configured.
- Rules determine how the load balancer routes the requests to its registered targets. Each rule consists of a priority, one or more actions and one or more conditions.
- Each target group routes requests to one or more registered targets, such as ec2 instances, using the protocol and port number as specified.
- Application load balancer only support HTTP and HTTPS.
- to use HTTPS there must be one SSL/TLS server certificate on the load balancer. The load balancer uses server certificate to terminate the frontend connection and decrypt requests from the clients before sending them to the targets.

#### Network Load Balancers (Network Layer 4)

- Use cases, where need extreme performance.
- Needed where protocols are not supported by Application Load Balancers.
- Network Load Balancers can decrypt traffic by installing the certificate on the Load Balancer.

#### Classic Load Balancers (Network Layer 4/7)

- 504 error means the gateway has timed out. The application is not responding within the idle timeout period. Basically the web server or the database server is down.
- To check the clients IPv4 address from the EC2 instance use case will be X-Forwarded-For header.

#### Sticky Sessions

- Sticky sessions enable user to stick the same EC2 instance. Can be useful if storing data locally to that instance. Disable sticky session if that specific instance is removed from the pool.
- Sticky sessions can be used in Application Load Balancers but the traffic will be sent at the target group level.

#### Deregistration Delay/Connection Draining

- Enabled Deregistratin delay keep existing connection open if the ec2 instance become unhealthy.
- Disable Deregistration Delay if the connection needs to close immediately to the instances that are de-registered or become unhealthy.

## Caching

### CloudFront

- CloudFront is the only option to add HTTPS to a static website being hosted in an S3 bucket.

### Global Accelerator

- Reduce issues with customers caching old IP addresses.

### Database Caching

- In-memory database solutions are 2 cases either DynamoDB or Redis. DynamoDB is the preferred solution.
- Redis has more features than Memcached. It can be used as a cache or as a persistent data store, where Memcache is just cache.
- Backups are only supported in Redis. Memcached and DAX do not support backups.
