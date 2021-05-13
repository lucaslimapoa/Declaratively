//
//  View.swift
//  Declaratively
//
//  Created by Lucas Lima on 12.05.21.
//

import Foundation

public protocol View {
    associatedtype Body: View
    var body: Body { get }
}

extension Never: View {
    public typealias Body = Never
}

extension View where Body == Never {
    public var body: Never { fatalError("\(type(of: Self.self)) has no body") }
}
