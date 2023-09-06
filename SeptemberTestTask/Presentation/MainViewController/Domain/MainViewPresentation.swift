import Foundation

protocol MainPresenter {
    func setContent(_ data: [String])
}

final class MainPresentation {

    private weak var view: MainViewInput?

    init(viewInput: MainViewInput) {
        view = viewInput
    }
}

extension MainPresentation {}

extension MainPresentation: MainPresenter {
    func setContent(_ data: [String]) {
        view?.setContent(data)
    }
}
