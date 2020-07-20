#!/bin/bash

set -u

echo "installing python packages..."

pip install \
    awslogs \
    pynvim

cat << END

**************************************************
Python packages INSTALLED! bye.
**************************************************

END
