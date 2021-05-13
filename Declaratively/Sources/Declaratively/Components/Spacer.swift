//
//  Spacer.swift
//  Declaratively
//
//  Created by Lucas Lima on 13.05.21.
//

import UIKit

public struct Spacer {
    let minLength: CGFloat
    
    public init(minLength: CGFloat? = nil) {
        self.minLength = minLength ?? 1
    }
}

extension Spacer: View {
    public typealias Body = Never
}

extension Spacer: UIViewRepresentable {
    public func makeUIView() -> UIView {
        SpacerView(minLength: minLength)
//        let view = UIView()
//        view.addLayoutGuide(UILayoutGuide())
////        view.translatesAutoresizingMaskIntoConstraints = false
////        NSLayoutConstraint.activate([
////            view.widthAnchor.constraint(greaterThanOrEqualToConstant: minLength),
////            view.heightAnchor.constraint(greaterThanOrEqualToConstant: minLength)
////        ])
////
////        view.setContentHuggingPriority(UILayoutPriority(0), for: .vertical)
////        view.setContentHuggingPriority(UILayoutPriority(0), for: .horizontal)
////        view.setContentCompressionResistancePriority(.required, for: .vertical)
////        view.setContentCompressionResistancePriority(.required, for: .horizontal)
//
//        return view
    }
}

final class SpacerView: UIView {
    private let minLength: CGFloat
    
    init(minLength: CGFloat) {
        self.minLength = minLength
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()

        if let stackView = superview as? UIStackView {
            translatesAutoresizingMaskIntoConstraints = false
            
            switch stackView.axis {
            case .horizontal:
                widthAnchor.constraint(greaterThanOrEqualToConstant: minLength).isActive = true
                setContentHuggingPriority(.defaultHigh, for: .horizontal)
                setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
            case .vertical:
                heightAnchor.constraint(greaterThanOrEqualToConstant: minLength).isActive = true
                setContentHuggingPriority(.defaultHigh, for: .vertical)
                setContentCompressionResistancePriority(.defaultHigh, for: .vertical)
            default:
                fatalError("Case not handled")
            }
        }
    }
}
