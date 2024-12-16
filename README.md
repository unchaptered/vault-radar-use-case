# Vaault Radar Usecase

본 문서는 Vault Radar CLI의 몇 가지 사용 사례를 다루고 있습니다.

[설치](./README.md#설치) 및 [설정](./README.md#설정) 단계를 수행한 후, 각 [목록](./README.md#목록) 폴더 안에서 action.sh을 실행해주새요.

## 번역본

- Korean : [open](./docs/README.md)
- English : [open](./docs/README_en.md)

## 설치

```shell
brew install vault-radar
```

## 설정

전체 [목록](./README.md#목록) 실습을 위해 HCP(HashiCorp Cloud Platform)에서 2가지를 생성해야 합니다.

1. HCP Vault Radar 생성하기
2. HCP IAM CLI Credentials 발급받기

이후 총 5가지 변수를 설정해야 성공적으로 각 action 파일이 실행이 됩니다.

```ini
DOCKER_API_VERSION=1.45
VAULT_RADAR_GIT_TOKEN="<PAT>"   # GitHub Personal Access Token
HCP_PROJECT_ID="<VALUE>"        # HCP Vault Radar 생성하면 할당받아짐
HCP_CLIENT_ID="<VALUE>"         # HCP IAM 생성 후 별도로 Key 발급해야함
HCP_CLIENT_SECRET="<VALUE>"     # HCP IAM 생성 후 별도로 Key 발급해야함
```

### DOCKER_API_VERSION

설치된 docker, docker-api 버전에 따라서 아래와 같은 에러가 발생할 수 있습니다.

```shell
unable to open a data source: Error response from daemon: client version 1.46 is too new. Maximum supported API version is 1.45
```

이 경우에는 DOCKER_API_VERSION을 명시하여 해결할 수 있습니다.

```shell
DOCKER_API_VERSION=1.45 vault-radar <command> <options>
```

### VAULT_RADAR_GIT_TOKEN

별다른 설정 없이 Vault Radar로 Git Repo를 스캔하면 아래와 같은 에러가 뜹니다.

```shell
Error: failed to find git token
```

이 경우에는 VAULT_RADAR_GIT_TOKEN을 명시하여 해결할 수 있습니다.

```shell
VAULT_RADAR_GIT_TOKEN을=1.45 vault-radar <command> <options>
```

실습 편의를 위해서 GitHub CLI를 설치 후 활용하여 GIT TOKEN(PAT, Personal Access Token)을 명시하겠습니다.

```shell
brew install gh
gh auth login
gh auth token
```

### HCP_CLIENT_ID, HCP_CLIENT_SECRET

HCP IAM에는 여러 유형이 존재합니다.

저희는 이 중에서 [service-principals](https://developer.hashicorp.com/hcp/docs/cli/commands/iam/service-principals)을 생성해야 합니다.

생성 이후에 CLI Key를 발급받으면 HCP_CLIENT_ID, HCP_CLIENT_SECRET을 할당해줍니다.

## 목록

- scan-fs/
- scan-image/
- scan-repository/