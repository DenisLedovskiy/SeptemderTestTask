import Foundation
import UIKit

protocol OneButtonInteractor {
    func screenDidReady()
    func screenWillAppear()
    func selectGoGoogle()
}

final class OneButtonInteraction {
    private let service = OneButtonService.shared
    private let presenter: OneButtonPresenter?

    init(presenter: OneButtonPresenter) {
        self.presenter = presenter
    }
}

extension OneButtonInteraction {}

extension OneButtonInteraction: OneButtonInteractor {
    func selectGoGoogle() {
        UserSettings.isGoogleMode = true
    }

    func screenWillAppear() {}
    func screenDidReady() {}
}
