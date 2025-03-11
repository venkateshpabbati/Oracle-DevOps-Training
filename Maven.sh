#!/bin/bash

# Exit on any error
set -e

# Update system packages
sudo yum update -y

# Install required dependencies
sudo yum install -y java-17-amazon-corretto wget tar

# Define Maven version
MAVEN_VERSION=3.9.6

# Download and extract Maven
cd /opt
sudo wget https://downloads.apache.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz
sudo tar -xvzf apache-maven-$MAVEN_VERSION-bin.tar.gz
sudo ln -s apache-maven-$MAVEN_VERSION apache-maven

# Set up environment variables
cat <<EOF | sudo tee /etc/profile.d/maven.sh
export M2_HOME=/opt/apache-maven
export PATH=\$M2_HOME/bin:\$PATH
EOF

# Load the environment variables immediately
source /etc/profile.d/maven.sh

# Verify Maven installation
mvn -version


__________________________________________________________
source /etc/profile.d/maven.sh
mvn -version