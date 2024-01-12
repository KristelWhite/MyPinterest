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
    var tokenStorage : TokenStorage {
        BaseTokenStorage()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        startLaunchProsses()
        window?.makeKeyAndVisible()
        return true
    }

    func runMainFlow() {
        window?.rootViewController = TabBarConfigurator().configure()
    }
    
    func startLaunchProsses () {
        runLaunchScreen()
        if let tokenContainer = try? tokenStorage.getToken(), !tokenContainer.isExpiring {
            runMainFlow()
        } else {
            let tempCredentials = AuthRequestModel(phone: "+79876543219", password: "qwerty")
            AuthService().performLoginRequestAndSaveToken(credentials: tempCredentials) { [weak self] result in
                switch result {
                case .success(_):
                    self?.runMainFlow()
                case .failure(_):
//                TODO: handler error
                    break
                }
            }
        }
    }
    
    func runLaunchScreen () {
        let launchScreenViewController = UIStoryboard(name: "LaunchScreen", bundle: .main).instantiateInitialViewController()
        window?.rootViewController = launchScreenViewController
    }

}

