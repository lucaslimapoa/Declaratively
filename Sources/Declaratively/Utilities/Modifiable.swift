//
//  Modifiable.swift
//  Declaratively
//
//  Created by Lucas Lima on 13.05.21.
//

import Foundation

protocol Modifiable {
    func modify<T>(path: WritableKeyPath<Self, T>, to value: T) -> Self
}

extension Modifiable {
    func modify<T>(path: WritableKeyPath<Self, T>, to value: T) -> Self {
        var clone = self
        clone[keyPath: path] = value
        return clone
    }
}
