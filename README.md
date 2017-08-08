# ActionPickerUtils

[![CI Status](http://img.shields.io/travis/anton-plebanovich/ActionPickerUtils.svg?style=flat)](https://travis-ci.org/anton-plebanovich/ActionPickerUtils)
[![Version](https://img.shields.io/cocoapods/v/ActionPickerUtils.svg?style=flat)](http://cocoapods.org/pods/ActionPickerUtils)
[![License](https://img.shields.io/cocoapods/l/ActionPickerUtils.svg?style=flat)](http://cocoapods.org/pods/ActionPickerUtils)
[![Platform](https://img.shields.io/cocoapods/p/ActionPickerUtils.svg?style=flat)](http://cocoapods.org/pods/ActionPickerUtils)

Utils global functions to simplify working with ActionSheetPicker-3.0

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Installation

#### Carthage

Please check [official guide](https://github.com/Carthage/Carthage#if-youre-building-for-ios-tvos-or-watchos)

Cartfile:

```
github "APUtils/ActionPickerUtils"
```

#### CocoaPods

ActionPickerUtils is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ActionPickerUtils'
```

## Usage

To pick date:
```
g_showDatePicker { date in
    print(date)
}
```

To pick string:
```
g_showStringsPicker(values: ["Hello", "World"]) { index, string in
    print(\(index) - \(string))
}
```

See example project for more details.

## Contributions

Any contribution is more than welcome! You can contribute through pull requests and issues on GitHub.

## Author

Anton Plebanovich, anton.plebanovich@gmail.com

## License

ActionPickerUtils is available under the MIT license. See the LICENSE file for more info.
