# Vaault Radar use caes

This document covers several use cases for the Vault Radar CLI.

After following the [installation](./README_en.md#installation) and [configuration](./README_en.md#configuration) steps, run action.sh inside each [list-up](./README_en.md#list-up).

## 번역본

- Korean : [open](./README_ko.md)
- English : [open](./README_en.md)

## Installation

```shell
brew install vault-radar
```

## Configuration

For the [list-up](./README_en.md#list-up) step, you need to create two things on the HashiCorp Cloud Platform (HCP).

1. Create HCP Vault Radar
2. Get HCP IAM CLI Credentials

After  total of 5 variables must be set for each action file to run successfully.

```ini
DOCKER_API_VERSION=1.45
VAULT_RADAR_GIT_TOKEN="<PAT>"   # GitHub Personal Access Token
HCP_PROJECT_ID="<VALUE>"        # HCP Vault Radar
HCP_CLIENT_ID="<VALUE>"         # HCP IAM
HCP_CLIENT_SECRET="<VALUE>"     # HCP IAM
```

### DOCKER_API_VERSION

Depending on the version of docker and docker-api installed, the following errors may occur.

```shell
unable to open a data source: Error response from daemon: client version 1.46 is too new. Maximum supported API version is 1.45
```

This can be resolved by specifying DOCKER_API_VERSION.

```shell
DOCKER_API_VERSION=1.45 vault-radar <command> <options>
```

### VAULT_RADAR_GIT_TOKEN

If you scan a Git Repo with Vault Radar without any settings, you'll get an error like the one below.

```shell
Error: failed to find git token
```

This can be resolved by specifying VAULT_RADAR_GIT_TOKEN in this case.

```shell
VAULT_RADAR_GIT_TOKEN을=1.45 vault-radar <command> <options>
```

For ease of practice, we will utilize the GitHub CLI after installation to specify the GIT TOKEN (PAT, Personal Access Token).

```shell
brew install gh
gh auth login
gh auth token
```

### HCP_CLIENT_ID, HCP_CLIENT_SECRET

There are several types of HCP IAM.

We need to create [service-principals](https://developer.hashicorp.com/hcp/docs/cli/commands/iam/service-principals) out of this.

If you are issued a CLI key after creating F2, assign HCP_CLIENT_ID, HCP_CLIENT_SECRET.

## List-up

- scan-fs/
- scan-image/
- scan-repository/