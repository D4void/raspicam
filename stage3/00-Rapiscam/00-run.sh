#!/bin/bash -e

# install all files for installation
mkdir -p ${ROOTFS_DIR}/opt/install/make_readonly
install -m 755 files/install.sh ${ROOTFS_DIR}/opt/install/
install -m 755 files/WiFiCheck.sh ${ROOTFS_DIR}/opt/install/
install -m 755 files/make_readonly/make_readonly.sh ${ROOTFS_DIR}/opt/install/make_readonly
install -m 644 files/make_readonly/bash-logout ${ROOTFS_DIR}/opt/install/make_readonly
install -m 644 files/make_readonly/boot-cmdline ${ROOTFS_DIR}/opt/install/make_readonly
install -m 644 files/make_readonly/fstab ${ROOTFS_DIR}/opt/install/make_readonly
install -m 644 files/make_readonly/rorw-prompt ${ROOTFS_DIR}/opt/install/make_readonly
install -m 644 files/make_readonly/systemd-random-seed.service ${ROOTFS_DIR}/opt/install/make_readonly
install -m 644 files/chrony.conf ${ROOTFS_DIR}/opt/install/
install -m 644 files/RTSP-Server.service ${ROOTFS_DIR}/opt/install/

