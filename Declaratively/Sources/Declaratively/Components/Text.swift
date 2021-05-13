//
//  Text.swift
//  Declaratively
//
//  Created by Lucas Lima on 12.05.21.
//

import UIKit


public struct Text {
    let text: String
    var modifiers = [Modifier]()
    
    public init(_ text: String) {
        self.text = text
    }
}

extension Text: Modifiable {
    enum Modifier {
        case foregroundColor(UIColor)
        case font(UIFont)
        case layoutPriority(Float)
        case padding(top: CGFloat, left: CGFloat, bottom: CGFloat, right: CGFloat)
    }
    
    public func foregroundColor(_ color: UIColor) -> Text {
        modify(path: \.modifiers, to: modifiers + [.foregroundColor(color)])
    }
    
    public func bold() -> Text {
        modify(path: \.modifiers, to: modifiers + [.font(.boldSystemFont(ofSize: 16))])
    }
    
    public func italic() -> Text {
        modify(path: \.modifiers, to: modifiers + [.font(.italicSystemFont(ofSize: 16))])
    }
    
    public func layoutPriority(_ value: Float) -> Text {
        modify(path: \.modifiers, to: modifiers + [.layoutPriority(value)])
    }
    
    public func pading(_ value: CGFloat = 16) -> Text {
        modify(path: \.modifiers, to: modifiers + [.padding(top: value, left: value, bottom: value, right: value)])
    }
    
    public func pading(top: CGFloat = 0, leading: CGFloat = 0, bottom: CGFloat = 0, trailing: CGFloat = 0) -> Text {
        modify(path: \.modifiers,to: modifiers + [.padding(top: top, left: leading, bottom: bottom, right: trailing)])
    }
}

extension Text: View {
    public typealias Body = Never
}

extension Text: UIViewRepresentable {
    public func makeUIView() -> UILabel {
        let label = TextLabel()
        label.text = text
        label.numberOfLines = 0
        applyModifiers(label)
        return label
    }
    
    private func applyModifiers(_ label: TextLabel) {
        modifiers.forEach {
            switch $0 {
            case let .foregroundColor(color):
                label.textColor = color
            case let .font(font):
                label.font = font
            case let .layoutPriority(value):
                label.setContentHuggingPriority(UILayoutPriority(value), for: .vertical)
                label.setContentHuggingPriority(UILayoutPriority(value), for: .horizontal)
            case let .padding(top, left, bottom, right):
                label.insets = UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
            }
        }
    }
}

private final class TextLabel: UILabel {
    var insets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    override func drawText(in rect: CGRect) {
        super.drawText(in: rect.inset(by: insets))
    }
    
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(
            width: size.width + insets.left + insets.right,
            height: size.height + insets.top + insets.bottom
        )
    }
}
