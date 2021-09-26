# SwiftObservable

Easy Swift utility which makes **Observing** values a breeze.

## Installation

### Cocoapod
```ruby
pod 'SwiftObservable'
```

### Swift Package Manager
The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

    In Xcode 11+ select File > Packages > Add Package Dependency
    Enter this project's URL: https://github.com/Valerio69/SwiftObservable


### Usage
```swift
import SwiftObservable

@Observed var name: String = "Jhon"

// Add a new observer (or multiple observers)
$name.observe(on: self) { (oldValue, newValue) in
    print(oldValue) 
    print(newValue) 
}

// Update the value
name = "Patric"

// Remove an observer
$name.remove(observer: self)

// Remove all observers
$name.removeAllObservers()

```
