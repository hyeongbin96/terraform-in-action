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

## Terraform 기본 명령어
* terraform init
   * 현재 디렉터리의 provider를 읽어 관련 플러그인을 자동으로 설치해주는 명령어

* terraform plan
   * 테라폼 코드로 인해 생성될 리소스 결과를 보여주는 명령어

* terraform apply
   * 테라폼 코드로 실제 리소스를 생성해주는 명령어

* terraform destroy
   * 테라폼으로 생성한 리소스를 삭제해주는 명령어 (.tfstate 파일 기준)
