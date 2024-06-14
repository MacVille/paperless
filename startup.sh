#!/usr/bin/env bash

echo "Start von Pre-Install Script"
echo "##################################################################"
apt-get update
apt-get install -y mosquitto mosquitto-clients
echo "##################################################################"