import UIKit
import SnapKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var appCoordinator = AppCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appCoordinator.start()
        return true
    }
}

