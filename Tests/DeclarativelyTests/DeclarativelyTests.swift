//
//  DeclarativelyTests.swift
//  DeclarativelyTests
//
//  Created by Lucas Lima on 12.05.21.
//

import XCTest
@testable import Declaratively

class DeclarativelyTests: XCTestCase {
    func testHostingViewControllerAddsCreatedSubView() {
        let view = TestView()
        let hostingViewController = UIHostingViewController(content: view)
        XCTAssertTrue(hostingViewController.view.subviews.first is UIStackView)
    }
}

private struct TestView: View {
    var body: VStack {
        VStack {
            Text("Something")
        }
    }
}
