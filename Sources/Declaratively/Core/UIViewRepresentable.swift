//
//  UIViewRepresentable.swift
//  Declaratively
//
//  Created by Lucas Lima on 12.05.21.
//

import UIKit

public protocol UIViewRepresentable: View where Self.Body == Never {
    associatedtype UIViewType: UIView
    func makeUIView() -> Self.UIViewType
}

public struct AnyUIViewRepresentable {
    let makeUIViewClosure: () -> UIView
    
    public init<T>(_ value: T) where T: UIViewRepresentable {
        self.makeUIViewClosure = {
            value.makeUIView()
        }
    }
    
    public func makeUIView() -> UIView {
        makeUIViewClosure()
    }
}
