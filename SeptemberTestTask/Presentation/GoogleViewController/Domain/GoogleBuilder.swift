import UIKit

final class GoogleBuilder {

    static func buildGoogleScreen() -> UIViewController {
        let vc = GoogleViewController()
        let navigator = GoogleNavigation(viewController: vc)
        let presentation = GooglePresentation(viewInput: vc)
        let interaction = GoogleInteraction(presenter: presentation)
        vc.bind(interactor: interaction, navigator: navigator)
        return vc
    }
}
