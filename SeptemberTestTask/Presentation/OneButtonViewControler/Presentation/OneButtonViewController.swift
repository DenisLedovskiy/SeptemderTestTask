import UIKit

protocol OneButtonViewInput: AnyObject {}

class OneButtonViewController: UIViewController {

    // MARK: - properties

    private var interactor: OneButtonInteractor!
    private var navigator: OneButtonNavigator!

    // MARK: - Dependency Injection

    func bind(interactor: OneButtonInteractor, navigator: OneButtonNavigator) {
        self.interactor = interactor
        self.navigator = navigator
    }

    // MARK: - views

    private var contentView = OneButtonView()

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
        setTargets()
    }

    // MARK: - methods

    private func setTargets() {
        contentView.googleButton.addTarget(self, action: #selector(tapGoGoogle), for: .touchUpInside)
    }

    @objc
    private func tapGoGoogle() {
        navigator.navigateGoogleScene()
        interactor.selectGoGoogle()
    }
}

extension OneButtonViewController: OneButtonViewInput {}

extension OneButtonViewController: OneButtonViewDelegate {}
