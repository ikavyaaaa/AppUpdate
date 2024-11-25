//
//  SceneDelegate.swift
//  AppUpdate
//
//  Created by Kavya Krishna K. on 25/11/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        kSceneDelegate = self
        guard let _ = (scene as? UIWindowScene) else { return }
        if let windowScene = scene as? UIWindowScene{
            let window = UIWindow(windowScene: windowScene)
            let rootViewController = LaunchVC.loadFromNib()
            window.rootViewController = rootViewController
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
    }

    func sceneWillResignActive(_ scene: UIScene) {
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
    }
}

extension SceneDelegate {
    func setLogin() {
        let loginVC = LoginVC.loadFromNib()
        let navigationController = UINavigationController(rootViewController: loginVC)
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
    }
}
