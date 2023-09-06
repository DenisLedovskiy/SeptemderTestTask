import Foundation
import UIKit
import CoreData

protocol MainInteractor {
    func selectSave(_ text: String)
    func screenDidReady()
}

final class MainInteraction {
    private let service = MainService.shared
    private let presenter: MainPresenter?
    private let dataSource: TextMODataSource?
    private let generator = UINotificationFeedbackGenerator()

    init(presenter: MainPresenter) {
        self.presenter = presenter
        self.dataSource = Store.viewContext.dataSource
    }
    
}

extension MainInteraction {

    private func fetch() {
        dataSource?.fetch { [self] result in
            switch result {
            case .fail(let error): print("Error: ", error)
                self.generator.notificationOccurred(.error)
            case .success: print("Succes fetch")
                guard let data = dataSource?.getAllItems() else {return}
                presenter?.setContent(data)
            }
        }
    }

    private func addText(_ text: String) {
        Store.viewContext.add(text) {
            result in
            switch result {
            case .fail(let error): print("Error: ", error)
                self.generator.notificationOccurred(.error)
            case .success: print("Success add product")
                self.generator.notificationOccurred(.success)
                self.fetch()
            }
        }
    }
}

extension MainInteraction: MainInteractor {
    func screenDidReady() {
        fetch()
    }

    func selectSave(_ text: String) {
        addText(text)
    }
}
