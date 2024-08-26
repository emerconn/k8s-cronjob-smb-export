<div align="center">

  [![License](https://img.shields.io/badge/license-AGPL--3.0-A42E2B)](/LICENSE)
  [![Docker](https://img.shields.io/docker/v/emerconnelly/k8s-cronjob-smb-export?label=Docker&sort=semver)](https://hub.docker.com/r/emerconnelly/k8s-cronjob-smb-export/tags)
  [![Renovate Dashboard](https://img.shields.io/badge/Renovate-555?logo=renovate&logoColor=497b9c&labelColor=000)](https://developer.mend.io/github/emerconnelly/k8s-cronjob-smb-export)
  
  # k8s-cronjob-smb-export
  Docker image for a K8s cronJob to export an archive backup file from a ReadyWriteMany PVC.

</div>

## Usage
Expects a single directory containing archives, which will export the most recent.

### Required Env Vars
- `SMB_USER_NAME=`
- `SMB_USER_DOMAIN=`
- `SMB_USER_PASSWORD=`
- `SMB_SERVICE_NAME=`
  - doesn't end with `/`
  - eg: `//fileShareName/rootFolder`
- `SMB_DIRECTORY=`
  - doesn't start or end with `/`
  - eg: `folder/anotherFolder/etcFolder`
- `ARCHIVE_FILE_DIRECTORY=`
  - does start but doesn't end with `/`
  - this is the directory within the PVC
  - eg: `/folder/anotherFolder/etcFolder`
