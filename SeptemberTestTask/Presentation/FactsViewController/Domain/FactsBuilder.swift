import UIKit

final class FactsBuilder {

    static func buildFactsScreen() -> UIViewController {
        let vc = FactsViewController()
        let navigator = FactsNavigation(viewController: vc)
        let presentation = FactsPresentation(viewInput: vc)
        let interaction = FactsInteraction(presenter: presentation)
        vc.bind(interactor: interaction, navigator: navigator)
        return vc
    }
}
