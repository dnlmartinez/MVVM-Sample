//
//  InjectionKey.swift
//  MVVM-Sample
//
//  Created by daniel martinez gonzalez on 29/5/23.
//


import Foundation

internal protocol InjectionKey {
    associatedtype Value
    
    static var currentValue: Self.Value { get set }
}

internal struct networkInjectionKey: InjectionKey {
    static var currentValue = NetworkService()
}



