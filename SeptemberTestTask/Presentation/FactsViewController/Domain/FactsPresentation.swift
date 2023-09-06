import Foundation

protocol FactsPresenter {
    func setContent(_ data: String)
    func viewShowSpinner()
    func viewHideSpinner()
    func setErrorAlert(_ message: String)
}

final class FactsPresentation {
    private weak var view: FactsViewInput?
    init(viewInput: FactsViewInput) {
        view = viewInput
    }
}

extension FactsPresentation {}

extension FactsPresentation: FactsPresenter {
    func setErrorAlert(_ message: String) {
        view?.setErrorAlert(message)
    }

    func viewShowSpinner() {
        view?.viewShowSpinner()
    }

    func viewHideSpinner() {
        view?.viewHideSpinner()
    }

    func setContent(_ data: String) {
        view?.setContent(data)
    }
}
