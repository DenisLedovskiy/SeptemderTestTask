import UIKit

protocol MainNavigator {

}

final class MainNavigation {

    private var baseViewController: UIViewController?

    init(viewController: UIViewController) {
        baseViewController = viewController
    }
}

extension MainNavigation: MainNavigator {

}
