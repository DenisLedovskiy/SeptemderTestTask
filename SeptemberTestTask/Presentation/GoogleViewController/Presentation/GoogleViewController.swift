import UIKit

protocol GoogleViewInput: AnyObject {}

class GoogleViewController: UIViewController {

    // MARK: - properties

    private var interactor: GoogleInteractor!
    private var navigator: GoogleNavigator!

    // MARK: - Dependency Injection

    func bind(interactor: GoogleInteractor, navigator: GoogleNavigator) {
        self.interactor = interactor
        self.navigator = navigator
    }

    // MARK: - views

    private var contentView = GoogleView()

    // MARK: - lifecycle

    override func loadView() {
        super.loadView()
        view = contentView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        interactor.screenWillAppear()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
    }

    // MARK: - methods
}

extension GoogleViewController: GoogleViewInput {}

extension GoogleViewController: GoogleViewDelegate {}
