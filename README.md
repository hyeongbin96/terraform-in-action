# **Terraform study for devops**
Terraform is IaC tool by Hashicorp<Br>
Terraform makes it easier to create and manage infrastructure.
  
## Terraform install & setting
1. Installation Terraform at Windows
   * https://developer.hashicorp.com/terraform/downloads

2. Registering Environment Variables
   * Available even if the path is different

3. Verify Terraform installed <Br>
   * ```Terraform version```

## 작업 환경
Windows에서 WSL2 설치 후 AWS-CLI 및 Terraform 설치

VIsual Studio Code

Terraform 1.3.7

## 필수 조건
* 리소스가 생성될 aws 계정 access key, secret key
* 위 aws 계정 key는 /home/$USER/.aws/credentials에서 프로필로 관리
* provider.tf 파일에서 credentials 참조하도록 설정
    ```
    # provider.tf
    
    provider = "aws" {
        region = "ap-northeast-2" //seoul region
        shared_credentials_files = [ "/home/$USER/.aws/credentials" ]
    }
