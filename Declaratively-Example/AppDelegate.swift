//
//  AppDelegate.swift
//  Declaratively-Example
//
//  Created by Lucas Lima on 13.05.21.
//

import UIKit
import Declaratively

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = UIHostingViewController(content: ContentView())
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}

