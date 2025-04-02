#!/bin/bash

# Install to a temporary directory
mkdir -p $SRC_DIR/temp_install
$PYTHON -m pip install --no-deps --no-build-isolation "${SRC_DIR}"/libboost_headers-*.whl -t $SRC_DIR/temp_install

# Locate boost/ headers
BOOST_DIR=$(find $SRC_DIR/temp_install -type d -name boost | head -n 1)

if [ -z "$BOOST_DIR" ]; then
  echo "ERROR: Boost headers not found after pip install."
  exit 1
fi

# Copy to $PREFIX/include
mkdir -p $PREFIX/include
cp -r "$BOOST_DIR" $PREFIX/include/

