# JUMBOTAIL ASSIGNMENT 
<br />

## 1. Dockerfile to Create a Jenkins Agent

I have created a Dockerfile to set up a customized Jenkins agent that can run either as a secondary agent or a standalone agent. When a container is run directly from the built image, Jenkins operates in standalone mode. When started with arguments or through environment variables in a Docker Compose setup, it can also function as a secondary agent.

### Setup Instructions

To build and run the Jenkins agent:

```bash
cd jenkins-docker
docker build -t jenkins-standalone-agent .
docker run -itd jenkins-standalone-agent
```

### Running with Parameters

To run the Jenkins agent with parameters, use the following command:
```bash
docker run -d -e JENKINS_AGENT_NAME=my-agent
-e JENKINS_URL=http://<your-jenkins-master>:8080/
-e JENKINS_SECRET=<agent-secret>
-e JENKINS_AGENT_WORKDIR=/home/jenkins/agent
Jenkins-agent-image
```


## Design AWS Infrastructure Architecture

### Determine Components:
- Frontend Server: Typically, an EC2 instance with a docker container running for the frontend including an internal nginx inside the frontend image.
- Backend Server: Creating docker images again for backend images and then running them on EC2 instances and using docker-compose for any external configuration needed by the containers. 
- Database Server: Amazon RDS or DynamoDB for data storage

### Draft Architecture:
- Create a VPC with public and private subnets.
- We will place the frontend in the public subnet as it will be able to serve web pages or APIs to users directly and backend+database in the private subnet which will give more security to sensitive data.
- Use security groups and ACL to control traffic between components.
- Implement an Internet Gateway and NAT Gateway for outbound internet access as even the backend might need connection to third party APIs for different needs.

<br /><br />
## 2. Creating Terraform templates for dynamoDB and EKS cluster implementation

I have created two separate folders inside the IAC folder for dynamoDB and eks cluster. Both can be separately executed and spun up. Inside the dynamodb folders I have created different folders for prod and test environments which contain modules for each respectively. 

There is another folder for spinning up the eks clusters which contains separate files which handles deployment for different services such as vpc, eks cluster and autoscaling modules. 

## Disaster Recovery

### DynamoDB: 
We will use point-in-time recovery (PITR) to restore tables to any point within the last 35 days. We can also set up cross-region replication for critical tables.

- Point-in-Time Recovery: We need to enable this feature on all critical DynamoDB tables. 

-  Cross-Region Replication: We would use DynamoDB global tables to replicate data across regions so that we have multiple instances of data as backups.

### Application Servers:
- Auto scaling groups for EC2 instances: We will use Auto Scaling groups spread across multiple AZs for our application servers. 

- Terraform Automation: We can also use Terraform to automate the recovery process by recreating infrastructure in a new region in case of failure

- Multi-Region Deployment: Pre-configuration of infrastructure in multiple regions can also be a solution if we use Terraform to deploy and manage resources automatically.


<br /><br />
## 3. A. Canary Deployment 

I have deployed two backend services for the application: one stable and the other - beta. I have given 3 replicasets to the stable deployment and 1 to the beta version. I have also created two services each for the respective versions; this would serve the purpose of a canary deployment where we can release the beta version of the application to limited users and make it available to limited users through ingress routes. This would also help us to easily upgrade the stable version to beta and beta to the next stage while keeping both the services independent.

### Two versions of deployed application and their separate services

## B. Istio Service Mesh & Logging and Monitoring

I have created a bash script to automate the installation and deployment of the Istio service mesh including the configuration required by it on kubernetes and also the monitoring and logging solutions. 

The below screenshots demonstrate that the script successfully installs the Istio mesh and also runs on top of the deployment services (deployments having two containers )

### Setup Instructions

```bash
cd 3-Canary-Istio-mesh
bash install-istio.sh
kubectl apply -f jumbo-app.yaml -f jumbo-app-beta.yaml -f jumbo-stable-svc.yaml -f jumbo-beta-svc.yaml
```

<br /><br />
## 4. Jenkins CI/CD Server

To set up a CI/CD server on kubernetes through helm charts I have used Jenkins and deployed it through a service to access it from outside the container (GUI on browser).

I have automated the whole process for this setup too through using a bash script. The script installs jenkins server through helm charts while creating a namespace "jenkins-server" and applying it on the same. Once applied and the services are up it is configured to give the admin user credentials as part of the script and port forward it so that it becomes automatically available for the user to access over a browser. 

The code for the jenkins pipeline to automate building and versioning of docker images have been uploaded to git and are present in the file: "image-builder" under CI-CD-jenkins folder

Pre-requirements: Kubernetes setup

### Setup Instructions

* Go to a jumpserver/ machine with kubeconfig configuration and follow the instructions below

```bash
bash jenkins-setup.sh
```
<br />
