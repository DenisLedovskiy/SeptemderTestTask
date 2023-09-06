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
    private var isGoogleMode = UserSettings.isGoogleMode

    func start() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.overrideUserInterfaceStyle = .light
        isGoogleMode == true ? makeGoogleScene() : makeMainScene()
    }

    func makeMainScene() {
        let module = configureTabBarController()
        window?.rootViewController = module
        window?.makeKeyAndVisible()
    }

    func makeGoogleScene() {
        let module = GoogleBuilder.buildGoogleScreen()
        window?.rootViewController = module
        window?.makeKeyAndVisible()
    }

    func moveGoogleScene() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.overrideUserInterfaceStyle = .light
        makeGoogleScene()
    }
}

extension AppCoordinator {
    func configureTabBarController() -> UITabBarController {
        let tabBarController = BaseTabBarController()
        tabBarController.viewControllers = [createVC(MainBuilder.buildMainScreen(), title: "Главная",
                                                     icon: Design.Image.book),
                                            createVC(FactsBuilder.buildFactsScreen(), title: "Факты", icon: Design.Image.fact),
                                            createVC(OneButtonBuilder.buildOneButtoneScreen(), title: "Google", icon: Design.Image.web)]
        return tabBarController
    }

    func createVC(_ vc: UIViewController, title: String, icon: UIImage?) -> UIViewController {
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = icon
        return navigationController
    }
}
