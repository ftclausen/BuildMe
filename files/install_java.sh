#!/usr/bin/env bash

set -ex

echo "===> Get apt ready"
apt-get update

echo "===> install required dependencies"
apt-get install -y fontconfig-config libfontconfig1 libfreetype6 curl wget zip

echo "===> install Java 11"
JAVA_VERSION="11.0.16.9-1"

apt-get install java-common

cd /tmp
DIR_NAME=$(echo $JAVA_VERSION | sed "s,-,.,g")
curl -o jdk.deb https://corretto.aws/downloads/resources/${DIR_NAME}/java-11-amazon-corretto-jdk_${JAVA_VERSION}_arm64.deb
dpkg --install jdk.deb
rm -f jdk.deb
apt-get clean

#
# Create the Java system prefs folder and sets proper permissions
#
JAVA_SYSTEMPREFS_DIR="/etc/.java/.systemPrefs"
mkdir -p $JAVA_SYSTEMPREFS_DIR
chmod a+rwx $JAVA_SYSTEMPREFS_DIR

# Verify Java is available now
java -version
