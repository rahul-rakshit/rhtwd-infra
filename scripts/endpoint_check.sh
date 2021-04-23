#!/bin/bash

endpoint=$1
expected_value=$2

actual_value=$(curl --silent $endpoint)

if [ "$actual_value" = "$expected_value" ]; then
  echo "Endpoint check succeeded."
else
  echo "Endpoint check failed." 1>&2
  echo "Expected: $expected_value" 1>&2
  echo "But received: $actual_value" 1>&2
  exit 1
fi
