# MCChatModule
A simple chat module to integrate with your app.

[![Swift Version][swift-image]][swift-url]
[![License][license-image]][license-url]
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/MCChatModule.svg)](https://img.shields.io/cocoapods/v/MCChatModule.svg)  
[![Platform](https://img.shields.io/cocoapods/p/MCChatModule.svg?style=flat)](http://cocoapods.org/pods/MCChatModule)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com) 

## Features

- [x] Customizable
- [x] Supports both landscape and portrait

## Requirements

- iOS 11.0+
- Xcode 9.3

## Installation

#### CocoaPods
You can use [CocoaPods](http://cocoapods.org/) to install `MCChatModule` by adding it to your `Podfile`:

```ruby
platform :ios, '11.0'
use_frameworks!
pod 'MCChatModule'
```

To get the full benefits import `MCChatModule` wherever you import UIKit

``` swift
import UIKit
import MCChatModule
```

#### Manually
1. Download and drop ```Sources``` in your project.  
2. Congratulations! 

## Use
Creating a chat screen is as simple as:

``` swift
class ExampleChatViewController: MessagesCollectionViewController, MessagesCollectionViewControllerDataSource {
    
    ///The messages to display
    var messages = [MessageType]() {
        didSet {
            collectionView?.reloadData()
        }
    }
    
    override func viewDidLoad() {
        datasource = self
    }
    
    func message(for indexPath: IndexPath) -> MessageType {
        return messages[indexPath.item]
    }
    
    func numberOfMessages() -> Int {
        return messages.count
    }
}
```

and setting the controller `delegate` and `datasource` properties.

## Contribute

Pull requests and issues are welcome.

## Notes

This project is intended as an **exercise** for both the chat module and pod creation (dealing with podspec is harder than coding😂) but you can still use it in your projects if you want. If you want more features and a supportive community, I would suggest using [MessageKit](https://github.com/MessageKit/MessageKit)

Please do **not** expect continuous support.

**Creator:**
Marco Capano – [@YourTwitter](https://twitter.com/marcocapano1) – marco24capano@icloud.com

Thanks to [@SD10](https://github.com/SD10) for helping with podspec.

Distributed under the MIT license. See ``LICENSE`` for more information.


[swift-image]:https://img.shields.io/badge/swift-4.0-orange.svg
[swift-url]: https://swift.org/
[license-image]: https://img.shields.io/badge/License-MIT-blue.svg
[license-url]: LICENSE
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[codebeat-image]: https://codebeat.co/badges/c19b47ea-2f9d-45df-8458-b2d952fe9dad
[codebeat-url]: https://codebeat.co/projects/github-com-vsouza-awesomeios-com

