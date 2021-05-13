//
//  UIHostingViewController.swift
//  Declaratively
//
//  Created by Lucas Lima on 12.05.21.
//

import UIKit

final public class UIHostingViewController<Content>: UIViewController where Content: View, Content.Body: UIViewRepresentable {
    private let content: Content
    
    public init(content: Content) {
        self.content = content
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let contentView = content.body.makeUIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(contentView)    
        
        NSLayoutConstraint.activate([
            contentView.centerXAnchor.constraint(equalTo: view.centerXAnchor).withPriority(999),
            contentView.centerYAnchor.constraint(equalTo: view.centerYAnchor).withPriority(999),
            contentView.widthAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.widthAnchor).withPriority(1000),
            contentView.heightAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.heightAnchor).withPriority(1000)
        ])
    }
}

private extension NSLayoutConstraint {
    func withPriority(_ value: Float) -> Self {
        self.priority = UILayoutPriority(value)
        return self
    }
}
