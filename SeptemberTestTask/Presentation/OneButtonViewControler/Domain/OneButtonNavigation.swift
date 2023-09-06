import UIKit

protocol OneButtonNavigator {
    func navigateGoogleScene()
}

final class OneButtonNavigation {
    private var baseViewController: UIViewController?
    private let appCoordinator = AppCoordinator()

    init(viewController: UIViewController) {
        baseViewController = viewController
    }
}

extension OneButtonNavigation: OneButtonNavigator {
    func navigateGoogleScene() {
        appCoordinator.moveGoogleScene()
    }
}
