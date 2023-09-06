import UIKit

final class OneButtonBuilder {

    static func buildOneButtoneScreen() -> UIViewController {
        let vc = OneButtonViewController()
        let navigator = OneButtonNavigation(viewController: vc)
        let presentation = OneButtonPresentation(viewInput: vc)
        let interaction = OneButtonInteraction(presenter: presentation)
        vc.bind(interactor: interaction, navigator: navigator)
        return vc
    }
}
