import UIKit

protocol FactsViewInput: AnyObject {
    func setContent(_ data: String)
    func viewShowSpinner()
    func viewHideSpinner()
    func setErrorAlert(_ message: String)
}

class FactsViewController: UIViewController {

    // MARK: - properties

    private var interactor: FactsInteractor!
    private var navigator: FactsNavigator!

    // MARK: - Dependency Injection

    func bind(interactor: FactsInteractor, navigator: FactsNavigator) {
        self.interactor = interactor
        self.navigator = navigator
    }

    // MARK: - views

    private var contentView = FactsView()

    // MARK: - lifecycle

    override func loadView() {
        super.loadView()
        view = contentView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        interactor.screenWillAppear()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
    }

    // MARK: - methods
}

extension FactsViewController: FactsViewInput {
    func setErrorAlert(_ message: String) {
        DispatchQueue.main.async {
            self.setErrorAlert(title: "Error", message: message)
        }
    }

    func viewShowSpinner() {
        DispatchQueue.main.async {
            self.showSpinner()
        }
    }

    func viewHideSpinner() {
        DispatchQueue.main.async {
            self.hideSpinner()
        }
    }

    func setContent(_ data: String) {
        DispatchQueue.main.async {
            self.contentView.setFact(data)
        }
    }
}

extension FactsViewController: FactsViewDelegate {}
