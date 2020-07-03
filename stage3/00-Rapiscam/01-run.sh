#!/bin/bash -e

on_chroot << EOF
cd /opt/install/
./install.sh
EOF
