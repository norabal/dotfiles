#!/bin/bash

set -u

echo "installing python packages..."

pip install \
    awslogs

cat << END

**************************************************
Python packages INSTALLED! bye.
**************************************************

END
