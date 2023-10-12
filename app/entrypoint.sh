#!/usr/bin/env sh

echo "[TASK] cd to: ${ARCHIVE_FILE_DIRECTORY}"
cd ${ARCHIVE_FILE_DIRECTORY}

echo "[TASK] setting ARCHIVE_FILE_NAME to most recent filename: $(ls -t | head -1)"
ARCHIVE_FILE_NAME=$(ls -t | head -1)

echo "[TASK] moving ${ARCHIVE_FILE_NAME} to ${SMB_SERVICE_NAME} at ${SMB_DIRECTORY}"
smbclient -U=${SMB_USER_NAME}@${SMB_USER_DOMAIN}%${SMB_USER_PASSWORD} ${SMB_SERVICE_NAME} --directory ${SMB_DIRECTORY} -c "put ${ARCHIVE_FILE_NAME}"
