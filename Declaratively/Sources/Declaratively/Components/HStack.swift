//
//  HStack.swift
//  Declaratively
//
//  Created by Lucas Lima on 13.05.21.
//

import UIKit

public struct HStack: View {
    public typealias Body = Never
    
    public enum Alignment {
        case bottom
        case center
        case firstTextBaseline
        case lastTextBaseline
        case top
    }
    
    let alignment: Alignment
    
    let spacing: CGFloat
    
    let content: () -> [AnyUIViewRepresentable]
    
    public init(alignment: Alignment = .center, spacing: CGFloat = 0, @ViewBuilder content: @escaping () -> [AnyUIViewRepresentable]) {
        self.alignment = alignment
        self.spacing = spacing
        self.content = content
    }
}

extension HStack: UIViewRepresentable {
    public func makeUIView() -> UIStackView {
        let stackView = UIStackView(arrangedSubviews: [])
        
        stackView.axis = .horizontal
        stackView.spacing = spacing
        stackView.alignment = .init(alignment)
        
        content()
            .map { $0.makeUIView() }
            .forEach(stackView.addArrangedSubview(_:))
        
        return stackView
    }
}

private extension UIStackView.Alignment {
    init(_ alignment: HStack.Alignment) {
        switch alignment {
        case .bottom:
            self = .bottom
        case .firstTextBaseline:
            self = .firstBaseline
        case .lastTextBaseline:
            self = .lastBaseline
        case .top:
            self = .top
        case .center:
            self = .center
        }
    }
}
