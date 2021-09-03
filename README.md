# SwiftObservable

Easy Swift utility which makes **Observing** values a breeze.

- ### Usage

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

// Remove the observer
$name.remove(observer: self)

// Remove all observers
$name.removeAllObservers()

```

