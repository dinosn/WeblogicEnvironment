#!/bin/bash
echo "========== Installation of JDK Package："$JDK_PKG"=========="
# install JDK
tar -zxvf $JDK_PKG -C /install
mv /install/jdk* /java

echo "==========JDK installation completed=========="
