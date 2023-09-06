import Foundation
import UIKit

protocol FactsInteractor {
    func screenDidReady()
    func screenWillAppear()
}

final class FactsInteraction {
    private let service = FactsService.shared
    private let presenter: FactsPresenter?

    init(presenter: FactsPresenter) {
        self.presenter = presenter
    }

}

extension FactsInteraction {
    private func getFact() {
        service.requestFact { result in
            self.presenter?.viewHideSpinner()
            switch result {
            case .success(let model):
                self.presenter?.setContent(model.first?.fact ?? "")
            case .failure(let error):
                self.presenter?.setErrorAlert(error.errorMessage ?? "Network error")
            }
        }
    }
}

extension FactsInteraction: FactsInteractor {
    func screenWillAppear() {
        presenter?.viewShowSpinner()
        getFact()
    }

    func screenDidReady() {}
}
