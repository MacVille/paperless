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
|PAPERLESS_START_UP_SCRIPT|/mnt/user/paperless/custom_scripts   |/custom-cont-init.d   | Skripte welche unter diesem Verzeichnis liegen, werden vor dem Starten des Webservers ausgeführt. Somit kommen bei jeden Neustart oder Update des Containers Funktionen installiert werden   |
| PAPERLESS_POST_CONSUME_SCRIPT  |   | /usr/src/paperless/scripts/post-consumption.sh  | Dieses Bash-Skript wird nach jeder Verarbeitung eines Dokumentes ausgeführt  |
| PAPERLESS_POST_CONSUMPTION_FOLDER  | /mnt/user/paperless/consume_script  | /usr/src/paperless/scripts  | Ordner in welchem die Consume Skripte vorhanden sind  |

