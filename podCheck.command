#!/bin/bash

base_dir=$(dirname "$0")
cd "$base_dir"

# Checking lib lint
pod lib lint --allow-warnings

# Checking spec lint
pod spec lint --allow-warnings
