import UIKit

protocol FactsNavigator {}

final class FactsNavigation {
    private var baseViewController: UIViewController?
    init(viewController: UIViewController) {
        baseViewController = viewController
    }
}

extension FactsNavigation: FactsNavigator {}
