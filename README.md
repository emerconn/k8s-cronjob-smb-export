# k8s-cronjob-smb-export
A Docker image that can run as a Kubernetes cronJob to export an archive backup file from a ReadyWriteMany PVC.

Expects a single directory containing the archives, which will be used to export the most recent.

https://hub.docker.com/r/emerconnelly/k8s-cronjob-smb-export

### Environment Variables
- `SMB_USER_NAME=` <exampleUsername>
- `SMB_USER_DOMAIN=` <domain.com>
- `SMB_USER_PASSWORD=` <examplePassword>
- `SMB_SERVICE_NAME=` <//fileShare/aRootFolder>
  - doesn't end with `/`
- `SMB_DIRECTORY=` <folder/anotherFolder>
  - doesn't start or end with `/`
- `ARCHIVE_FILE_DIRECTORY=` </folder/anotherFolder>
  - does start but doesn't end with `/`
