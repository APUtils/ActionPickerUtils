
#!/bin/bash
set -e

base_dir=$(dirname "$0")
cd "$base_dir"

echo ""
echo ""
echo "Building Pods project..."
set -o pipefail && xcodebuild -workspace "Example/ActionPickerUtils.xcworkspace" -scheme "ActionPickerUtils-Example" -configuration "Release" -sdk iphonesimulator | xcpretty

echo -e "\nBuilding Carthage project..."
set -o pipefail && xcodebuild -project "ActionPickerUtils.xcodeproj" -sdk iphonesimulator -target "ActionPickerUtils" | xcpretty

echo -e "\nBuilding with Carthage..."
carthage build --no-skip-current --cache-builds

echo ""
echo "SUCCESS!"
echo ""
echo ""
