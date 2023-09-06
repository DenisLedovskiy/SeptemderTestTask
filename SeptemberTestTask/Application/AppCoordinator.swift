//
//  AppCoordinator.swift
//  SeptemberTestTask
//
//  Created by Денис Ледовский on 05.09.2023.
//

import Foundation
import UIKit

class AppCoordinator {

    var window: UIWindow?

    func start() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.overrideUserInterfaceStyle = .light
        mainScene()
    }

    func mainScene() {
        let module = configureTabBarController()
        window?.rootViewController = module
        window?.makeKeyAndVisible()
    }
}

extension AppCoordinator {
    func configureTabBarController() -> UITabBarController {
        let tabBarController = BaseTabBarController()
        tabBarController.viewControllers = [createVC(MainBuilder.buildMainScreen(), title: "Главная",
                                                     icon: Design.Image.book),
                                            createVC(ViewController(), title: "Факты", icon: Design.Image.fact),
                                            createVC(ViewController(), title: "Google", icon: Design.Image.web)]
        return tabBarController
    }

    func createVC(_ vc: UIViewController, title: String, icon: UIImage?) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = icon
        return navigationController
    }
}
