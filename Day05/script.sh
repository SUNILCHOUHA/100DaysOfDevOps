#!/bin/bash
set -e

# Update system
apt-get update -y

# Install MySQL Client (not server)
apt-get install -y mysql-client

# Verify installation
mysql --version
