import Foundation
import UIKit

protocol GoogleInteractor {
    func screenDidReady()
    func screenWillAppear()
}

final class GoogleInteraction {
    private let service = GoogleService.shared
    private let presenter: GooglePresenter?
    private let generator = UINotificationFeedbackGenerator()

    init(presenter: GooglePresenter) {
        self.presenter = presenter
    }
}

extension GoogleInteraction {}

extension GoogleInteraction: GoogleInteractor {
    func screenWillAppear() {}
    func screenDidReady() {}
}
