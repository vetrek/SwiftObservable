import Foundation

@propertyWrapper
public struct Observed<Value> {
    private var observable: Observable<Value>
    
    public var wrappedValue: Value {
        get {
            return observable.value
        }
        set {
            observable.value = newValue
        }
    }
    
    public init(wrappedValue: Value) {
        observable = .init(wrappedValue)
    }
    
    public init(initialValue: Value) {
        observable = .init(initialValue)
    }
    
    /// The property for which this instance exposes an Observable.
    ///
    /// The ``Observed/projectedValue`` is the property accessed with the `$` operator.
    public var projectedValue: Observable<Value> { observable }
}

/// Data Binding class without any 3rd party libraries
public final class Observable<Value> {
    
    struct Observer<Value> {
        weak var observer: AnyObject?
        let block: (_ oldValue: Value, _ newValue: Value) -> Void
    }
    
    private var observers = [Observer<Value>]()
    
    fileprivate var value: Value {
        didSet { notifyObservers(oldValue: oldValue) }
    }
    
    public init(_ value: Value) {
        self.value = value
    }
    
    public func observe(on observer: AnyObject, observerBlock: @escaping (Value, Value) -> Void) {
        // remove invalid observer before adding new ones
        observers = observers.filter { $0.observer != nil }
        observers.append(Observer(observer: observer, block: observerBlock))
        observerBlock(value, value)
    }
    
    public func remove(observer: AnyObject) {
        observers = observers.filter { $0.observer !== observer }
    }
    
    public func removeAllObservers() {
        observers.removeAll()
    }
    
    private func notifyObservers(oldValue: Value) {
        for observer in observers {
            DispatchQueue.main.async { observer.block(oldValue, self.value) }
        }
    }
    
}
