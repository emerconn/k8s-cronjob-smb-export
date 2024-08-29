<div align="center">

  [![License](https://img.shields.io/badge/license-AGPL--3.0-A42E2B)](/LICENSE)
  [![Docker](https://img.shields.io/docker/v/emerconnelly/k8s-cronjob-smb-export?label=Docker&sort=semver)](https://hub.docker.com/r/emerconnelly/k8s-cronjob-smb-export/tags)
  [![Renovate Dashboard](https://img.shields.io/badge/Renovate-555?logo=renovate&logoColor=497b9c&labelColor=000)](https://developer.mend.io/github/emerconnelly/k8s-cronjob-smb-export)

</div>

# k8s-cronjob-smb-export

Docker image for a K8s cronJob to export an archive backup file from a ReadyWriteMany PVC.

## Usage

Expects a single directory from which the most recent file will be used.

### Variables

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

### Container Images

The container images are hosted in both [ghcr.io](https://github.com/emerconnelly/k8s-cronjob-smb-export/pkgs/container/k8s-cronjob-smb-export) and [Docker Hub](https://hub.docker.com/r/emerconnelly/k8s-cronjob-smb-export).

```yaml
docker pull ghcr.io/emerconnelly/k8s-cronjob-smb-export:latest
# or
docker pull emerconnelly/k8s-cronjob-smb-export
```

### K8s example

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: smb-export
data:
  ARCHIVE_FILE_DIRECTORY: /var/out-dir-example-app/instance/server/default/data/archive
  SMB_DIRECTORY: example-app/prod
  SMB_SERVICE_NAME: //fileserver.domain.com/backups
  SMB_USER_DOMAIN: .domain.com
  SMB_USER_NAME: smb_export_sa
---
apiVersion: v1
kind: Secret
metadata:
  name: smb-export
type: Opaque
stringData:
  SMB_USER_PASSWORD: p@ssword1234
---
apiVersion: batch/v1
kind: CronJob
metadata:
  name: smb-export
spec:
  schedule: '@daily'
  timeZone: America/Chicago
  jobTemplate:
    spec:
      template:
        spec:
          containers:
            name: smb-export
            image: emerconnelly/k8s-cronjob-smb-export:latest
          - envFrom:
            - configMapRef:
                name: smb-export
            - secretRef:
                name: smb-export
            volumeMounts:
            - mountPath: /var/out-dir-example-app
              name: example-app-pvc
          volumes:
          - name: example-app-pvc
            persistentVolumeClaim:
              claimName: example-app-pvc
```
