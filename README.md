# HighlightTextView

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

<p align="center">
  <img src="HighlightTextView.png" width=375>
  <img src="HighlightTextView.gif" width=375>
</p>

## Requirements

Swift **3.0**
iOS **8.0+**

## Installation

### Carthage

HighlightTextView is available through Carthage. To install it, simply add the following line to your Cartfile:
```
github "yusayusa/HighlightTextView"
```

### CocoaPods

TODO

## Usage
```swift
let textView: UITextView

// set condition (maximum character limit and background color, minimum character limit and background color)

let condition = Condition(range: Range(uncheckedBounds: (lower: 20, upper: 50)),
                          minHighlightColor: UIColor.gray,
                          maxHighlightColor: UIColor.red)
textView.set(condition: condition)
```

## License
HighlightTextView is released under the MIT license. Go read the LICENSE file for more information.
