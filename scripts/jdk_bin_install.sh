#!/bin/bash
echo "==========Installing JDK："$JDK_PKG"=========="
# install JDK
cp $JDK_PKG /install/$JDK_PKG
rm -rf $JDK_PKG
chmod +x /install/$JDK_PKG
/install/$JDK_PKG
mv /jdk* /java

echo "==========JDK installation completed=========="
