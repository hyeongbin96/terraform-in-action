# 목차
### [테라폼 variable 예제 (AWS S3)](variables-example-s3/)
### [테라폼 variables을 사용한 vpc 구성](vpc/)

<br>

# 개요
> 테라폼에서 variable을 사용하여 간단한 s3 생성 및 vpc 구성

<br>

## 우선 순위
만약 variables.tf에서 default로 변수 값을 정의하고 terraform.tfvars에도 변수 값을 정의하면 최종 인프라엔 어떤 변수 값이 반영될까?

결과적으로 terraform.tfvars의 변수 값이 최종 인프라에 반영되었음

* terraform.tfvaars > variables.tf default
