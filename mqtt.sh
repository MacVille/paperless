#!/usr/bin/env bash

mosquitto_pub -h [[MQTT_Broker]] --username [[MQTT USER]] --pw [[MQTT PASSWORD]] -t paperless/post-consumption -m '{
    "id":"'"${DOCUMENT_ID}"'",
    "file_name":"'"${DOCUMENT_FILE_NAME}"'",
    "created":"'"${DOCUMENT_CREATED}"'",
    "modified":"'"${DOCUMENT_MODIFIED}"'",
    "added":"'"${DOCUMENT_ADDED}"'",
    "source_path":"'"${DOCUMENT_SOURCE_PATH}"'",
    "archive_path":"'"${DOCUMENT_ARCHIVE_PATH}"'",
    "thumbnail_path":"'"${DOCUMENT_THUMBNAIL_PATH}"'",
    "download_url":"'"${DOCUMENT_DOWNLOAD_URL}"'",
    "thumbnail_url":"'"${DOCUMENT_THUMBNAIL_URL}"'",
    "correspondent":"'"${DOCUMENT_CORRESPONDENT}"'",
    "tags":"'"${DOCUMENT_TAGS}"'",
    "original_filename":"'"${DOCUMENT_ORIGINAL_FILENAME}"'",
    "task_id":"'"${TASK_ID}"'"
}'