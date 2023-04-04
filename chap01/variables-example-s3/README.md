# 개요
* 테라폼에서 variable 사용법

<br>

## 작업
* S3 생성 (main.tf)

* variables.tf, terraform.tfvars

* 실행
```
terraform init
terraform apply
```

<br>

### 우선 순위
variables.tf에서 default로 변수 정의 vs terraform.tfvars에서 변수 정의 시 최종 인프라엔 어떤 변수 값이 반영될까?
* variables.tf < terraform.tfvars