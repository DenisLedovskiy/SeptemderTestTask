import Foundation

protocol GooglePresenter {}

final class GooglePresentation {
    private weak var view: GoogleViewInput?
    init(viewInput: GoogleViewInput) {
        view = viewInput
    }
}

extension GooglePresentation {}

extension GooglePresentation: GooglePresenter {}
