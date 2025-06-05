//
//  AppDelegate.swift
//  ViperExample
//
//  Created by Kostiantyn Antoniuk on 05.06.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    let dependencies = AppDependencies()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = dependencies.makeToDoListModule()
        window.rootViewController = rootVC
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}
