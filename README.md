# paperless-ngx HomeAssistant Benachrichtigung

## Vorraussetzungen

1. paperless-ngx Installation. (Docker, Baremetal, LXC usw.)
2. MQTT Client. (in diesem Fall nutzte ich mosquitto)
3. MQTT Broker welcher die Topic erhält.
4. Home Assistant zum Verarbeiten der MQTT Daten

### WICHTIG! Bei Docker Installation

Damit der MQTT Client nahezu Persistent ist, muss in der Docker Konfiguration folgendes definerit sein:
![Docker Config](https://github.com/MacVille/paperless/blob/caba4a5125621179cb6bfb5fa11c7fcf20ca1d75/img/Screenshot%202024-06-15%20011815.png)
Dies sind die Einstellungen welche man treffen muss für UnRaid als Dockerhost.

|Name   |HOSTEPATH   |CONTAINERPATH   |Beschreibung|
|---|---|---|---|
|PAPERLESS_START_UP_SCRIPT|/mnt/user/paperless/custom_scripts   |/custom-cont-init.d   |    |
|   |   |   |   |
|   |   |   |   |