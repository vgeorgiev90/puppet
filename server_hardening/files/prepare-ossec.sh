#!/bin/bash


sed -i 's/#USER_LANGUAGE="en"/USER_LANGUAGE="en"/' /root/ossec/etc/preloaded-vars.conf
sed -i 's/#USER_INSTALL_TYPE="local"/USER_INSTALL_TYPE="local"/' /root/ossec/etc/preloaded-vars.conf
sed -i 's/#USER_DIR="\/var\/ossec"/USER_DIR="\/var\/ossec"/' /root/ossec/etc/preloaded-vars.conf
sed -i 's/#USER_ENABLE_ACTIVE_RESPONSE="y"/USER_ENABLE_ACTIVE_RESPONSE="y"/' /root/ossec/etc/preloaded-vars.conf
sed -i 's/#USER_ENABLE_SYSCHECK="y"/USER_ENABLE_SYSCHECK="y"/' /root/ossec/etc/preloaded-vars.conf
sed -i 's/#USER_ENABLE_ROOTCHECK="y"/USER_ENABLE_ROOTCHECK="y"/' /root/ossec/etc/preloaded-vars.conf
sed -i 's/#USER_ENABLE_EMAIL="y"/USER_ENABLE_EMAIL="n"/' /root/ossec/etc/preloaded-vars.conf
sed -i 's/#USER_ENABLE_FIREWALL_RESPONSE="y"/USER_ENABLE_FIREWALL_RESPONSE="y"/' /root/ossec/etc/preloaded-vars.conf
sed -i 's/#USER_WHITE_LIST="192.168.2.1 192.168.1.0\/24"/USER_WHITE_LIST="10.0.0.0\/8"/' /root/ossec/etc/preloaded-vars.conf
