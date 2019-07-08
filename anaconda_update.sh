#!/bin/bash

set -u

echo "Updating anaconda itself..."
conda update -n base conda -y

echo "Updating anaconda all packages..."
conda update --all -y
