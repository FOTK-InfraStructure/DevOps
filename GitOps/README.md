# **GitOps**
## **Overview**
![Terraform_GitOps](./img/GitOps_Terraform.png)

현재 `Sparta42`의 일부 인프라는 `IaC`인 `Terraform`을 이용해 관리중.\
`Terraform`으로 작성된 코드는 지정 저장소로 `Push`됨.

---
## **What is GitOps?**
`GitOps`는 제어 시스템의 오픈소스 버전인 `Git`을 사용해 인프라 및 애플리케이션 구성을 관리하기 위한 일련의 방법.\
`GitOps`는 `Git`을 선언적 인프라 및 애플리케이션에 대한 `단일 진실 공급원(Single Source Of Truth, SSOT)`로 사용하는 방식으로 작동.

---
## **Reson for Introduction**
`Ops`가 한명임으로 `Terraform`의 핵심인 `.tfstate`파일이 `Ops`의 로컬에서 관리중.\
추후 `Ops`인원이 늘어났을때 `.tfstate`파일의 안정적 관리를 위해 다양한 방법들을 고민함.\
![Terraform_Lock](./img/GitOps_Terraform_lock.jpg)

이전에 사용했던 방법 `.tfstate`파일의 백업장소를 `AWS S3 Bucket`으로 지정한 후 `dynamoDB`를 이용해 `.tfstate`파일의 `lock`을 달성함.\
하지만 `Ops`가 여러명일때 항상 원격 `.tfstate`의 상태를 체크해야하고 `lock`이 걸려있는 동안 다른 인원의 `task`가 지연되는 경우가 발생함.\
이를 해결하기 위해 `Git`에 코드를 `Commit`하고 `CI/CD` 파이프라인을 이용해 인스턴스를 관리하는 방법을 도입 하려고 함.