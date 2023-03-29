# 개요
* 테라폼 RESOURCE로 AWS 기본 인프라 환경 구성하기

## 구성도
![](https://d1tlzifd8jdoy4.cloudfront.net/wp-content/uploads/2021/03/AWS-2tier-Networking-640x525.png)

## 작업 순서
* VPC 구성
   * VPC, Subnet, IGW, RT, SG

* EC2 구성
   * KeyPair, amazon linux

* RDS 구성
   * RDS Mysql, Subnet Groups

* S3 구성
   * S3, Policy

## 테라폼 구조
├─ terraform_study<br>
│ ├─ terraform_study_20230202<br>
│ │ &nbsp; ├─ .terraform<br>
│ │ &nbsp; ├─ provider.tf<br>
│ │ &nbsp; ├─ vpc.tf<br>
│ │ &nbsp; ├─ ec2.tf<br>
│ │ &nbsp; ├─ rds.tf<br>
│ │ &nbsp; ├─ s3.tf<br>
│ │ &nbsp; ├─ variables.tf<br>
│ │ &nbsp; ├─ outputs.tf<br>