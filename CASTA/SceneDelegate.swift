//
//  SceneDelegate.swift
//  CASTA
//
//  Created by kamlesh kumar on 07/11/20.
//  Copyright © 2020 Kamalesh Kumar Yadav. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		 window = UIWindow(windowScene: windowScene)
    self.window!.backgroundColor = .white
    self.window!.rootViewController = UINavigationController(rootViewController: ListViewController())
    self.window!.makeKeyAndVisible()
		
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
