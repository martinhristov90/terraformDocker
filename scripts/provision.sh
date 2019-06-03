#!/bin/bash

which curl docker make jq unzip|| {
  sudo apt-get update
  sudo apt-get install -y curl docker.io make jq unzip
  sudo usermod -a -G docker ubuntu
  sudo apt-get clean

}