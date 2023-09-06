import UIKit

final class MainBuilder {

    static func buildMainScreen() -> UIViewController {
        let vc = MainViewController()
        let navigator = MainNavigation(viewController: vc)
        let presentation = MainPresentation(viewInput: vc)
        let interaction = MainInteraction(presenter: presentation)
        vc.bind(interactor: interaction, navigator: navigator)
        return vc
    }
}
