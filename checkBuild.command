#!/bin/bash

base_dir=$(dirname "$0")
cd "$base_dir"

xcodebuild -workspace "Example/ActionPickerUtils.xcworkspace" -scheme "ActionPickerUtils-Example" -configuration "Release" -sdk iphonesimulator12.1 | xcpretty
echo
carthage build --no-skip-current
