//
//  VStack.swift
//  Declaratively
//
//  Created by Lucas Lima on 12.05.21.
//

import UIKit

public struct VStack: View {
    public typealias Body = Never
    
    public enum Alignment {
        case leading
        case center
        case trailing
    }
    
    let alignment: Alignment
    
    let spacing: CGFloat
    
    let content: () -> [AnyUIViewRepresentable]
    
    public init(alignment: Alignment = .leading, spacing: CGFloat = 0, @ViewBuilder content: @escaping () -> [AnyUIViewRepresentable]) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content
    }
}

extension VStack: UIViewRepresentable {
    public func makeUIView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [])
        
        stackView.axis = .vertical
        stackView.spacing = spacing
        stackView.alignment = .init(alignment)
        
        content()
            .map { $0.makeUIView() }
            .forEach(stackView.addArrangedSubview(_:))
        
        return stackView
    }
}

private extension UIStackView.Alignment {
    init(_ alignment: VStack.Alignment) {
        switch alignment {
        case .center:
            self = .center
        case .leading:
            self = .leading
        case .trailing:
            self = .trailing
        }
    }
}
