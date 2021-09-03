import Foundation

@propertyWrapper
public struct Observed<Value> {
    private var observable: Observable
    
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
    
    /// Data Binding class without any 3rd party libraries
    public final class Observable {
        
        struct Observer<Value> {
            weak var observer: AnyObject?
            let block: (Value) -> Void
        }
        
        private var observers = [Observer<Value>]()
        
        fileprivate var value: Value {
            didSet { notifyObservers() }
        }
        
        public init(_ value: Value) {
            self.value = value
        }
        
        public func observe(on observer: AnyObject, observerBlock: @escaping (Value) -> Void) {
            // remove invalid observer before adding new ones
            observers = observers.filter { $0.observer != nil }
            observers.append(Observer(observer: observer, block: observerBlock))
            observerBlock(self.value)
        }
        
        public func remove(observer: AnyObject) {
            observers = observers.filter { $0.observer !== observer }
        }
        
        public func removeAllObservers() {
            observers.removeAll()
        }
        
        private func notifyObservers() {
            for observer in observers {
                DispatchQueue.main.async { observer.block(self.value) }
            }
        }
        
    }
    
    /// The property for which this instance exposes an Observable.
    ///
    /// The ``Observed/projectedValue`` is the property accessed with the `$` operator.
    public var projectedValue: Observed<Value>.Observable { observable }
}
