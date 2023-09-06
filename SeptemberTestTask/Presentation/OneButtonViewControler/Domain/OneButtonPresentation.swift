import Foundation

protocol OneButtonPresenter {}

final class OneButtonPresentation {
    private weak var view: OneButtonViewInput?
    init(viewInput: OneButtonViewInput) {
        view = viewInput
    }
}

extension OneButtonPresentation {}

extension OneButtonPresentation: OneButtonPresenter {}
