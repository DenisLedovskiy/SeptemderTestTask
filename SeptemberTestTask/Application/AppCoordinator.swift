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
//        let module = MainBuilder.buildMainScreen()
        let module = ViewController()
        window?.rootViewController = module
        window?.makeKeyAndVisible()
    }
}
