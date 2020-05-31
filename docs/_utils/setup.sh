#!/bin/bash

cd ..
python -m pip install --upgrade pip
CASS_DRIVER_NO_CYTHON=1 python setup.py develop
pip install -r docs/docs-requirements.txt
CASS_DRIVER_NO_CYTHON=1 python setup.py build_ext --inplace --force
