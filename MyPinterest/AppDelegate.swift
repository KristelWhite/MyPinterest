//
//  AppDelegate.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 07.11.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        goToMain()
        window?.makeKeyAndVisible()
        return true
    }

    func goToMain() {
        window?.rootViewController = TabBarConfigurator().configure()
    }
    

}

