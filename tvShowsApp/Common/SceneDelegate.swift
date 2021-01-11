//
//  SceneDelegate.swift
//  tvShowsApp
//
//  Created by Josafat Martínez  on 11/01/21.
//

import UIKit
@available(iOS 13.0, *)
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard (scene as? UIWindowScene) != nil else { return }
    }
}
