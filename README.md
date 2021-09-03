# SwiftObservable

Easy Swift utility which makes **Observing** values a breeze.

## Installation

### Swift Package Manager
The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler. 

```swift
dependencies: [
    .package(url: "https://github.com/Valerio69/SwiftObservable", .upToNextMajor(from: "0.0.2"))
]
```

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
