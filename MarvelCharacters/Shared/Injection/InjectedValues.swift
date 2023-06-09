//
//  InjectedValues.swift
//  MVVM-Sample
//
//  Created by daniel martinez gonzalez on 29/5/23.
//

import Foundation

/// Injected values to unit testing
internal struct InjectedValues {
    
    /// This is only used as an accessor to the computed properties within extensions of `InjectedValues`.
    static var current = InjectedValues()
    
    /// A static subscript for updating the `currentValue` of `InjectionKey` instances.
    static subscript<K>(key: K.Type) -> K.Value where K : InjectionKey {
        get { key.currentValue }
        set { key.currentValue = newValue }
    }
    
    /// A static subscript accessor for updating and references dependencies directly.
    static subscript<T>(_ keyPath: WritableKeyPath<InjectedValues, T>) -> T {
        get { current[keyPath: keyPath] }
        set { current[keyPath: keyPath] = newValue }
    }
}

/// Injected keys
internal extension InjectedValues {
    var network: NetworkService {
        get { Self[networkInjectionKey.self] }
        set { Self[networkInjectionKey.self] = newValue }
    }
    
}
