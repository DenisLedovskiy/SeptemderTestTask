import UIKit

protocol GoogleNavigator {}

final class GoogleNavigation {
    private var baseViewController: UIViewController?
    init(viewController: UIViewController) {
        baseViewController = viewController
    }
}

extension GoogleNavigation: GoogleNavigator {}
