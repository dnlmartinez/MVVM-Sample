//
//  Injected.swift
//  MVVM-Sample
//
//  Created by daniel martinez gonzalez on 29/5/23.

import Foundation

@propertyWrapper
internal struct Injected<T> {
    
    private let keyPath: WritableKeyPath<InjectedValues, T>
    
    public var wrappedValue: T {
        get { InjectedValues[keyPath] }
        set { InjectedValues[keyPath] = newValue }
    }
    
    public init(_ keyPath: WritableKeyPath<InjectedValues, T>) {
        self.keyPath = keyPath
    }
}
