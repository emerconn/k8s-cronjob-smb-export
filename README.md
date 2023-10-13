<div align="center">

  [![License](https://img.shields.io/badge/license-AGPL--3.0-brightgreen)](/LICENSE)
  [![Docker Image Version (latest semver)](https://img.shields.io/docker/v/emerconnelly/k8s-cronjob-smb-export?label=Docker%20version&sort=semver)](https://hub.docker.com/r/emerconnelly/k8s-cronjob-smb-export/tags)
  
  # k8s-cronjob-smb-export
  Docker image for a K8s cronJob to export an archive backup file from a ReadyWriteMany PVC.
  
</div>

### How To Use
Expects a single directory containing the archives, which will be used to export the most recent.

#### Required Environment Variables
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
