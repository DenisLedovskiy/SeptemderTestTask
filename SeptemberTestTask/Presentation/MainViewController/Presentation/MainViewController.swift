import UIKit

protocol MainViewInput: AnyObject {
    func setContent(_ data: [String])
}

class MainViewController: UIViewController {

    // MARK: - properties

    private var interactor: MainInteractor!
    private var navigator: MainNavigator!
    private lazy var dataSource = MainViewUITableViewDataSource()

    // MARK: - Dependency Injection

    func bind(interactor: MainInteractor, navigator: MainNavigator) {
        self.interactor = interactor
        self.navigator = navigator
    }

    // MARK: - views

    private var contentView = MainView()

    // MARK: - lifecycle

    override func loadView() {
        super.loadView()
        view = contentView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        contentView.delegate = self
        contentView.mainTable.dataSource = dataSource
        setupTargets()
        interactor.screenDidReady()
    }

    // MARK: - methods

    func setupTargets() {
        contentView.saveButton.addTarget(self, action: #selector(tapSave), for: .touchUpInside)
        contentView.textField.addTarget(self, action: #selector(editText), for: .editingChanged)
    }

    @objc
    private func tapSave() {
        let text = contentView.textField.text ?? ""
        if text == "" {
            contentView.setErrorState()
        } else {
            contentView.clearTextField()
            interactor.selectSave(text)
        }
    }

    @objc
    private func editText() {
        let text = contentView.textField.text ?? ""
        if !contentView.isErrorHide {
            if text != "" {
                contentView.hideErrorState()
            }
        }
    }
}

extension MainViewController: MainViewInput {
    func setContent(_ data: [String]) {
        dataSource.content = data
        DispatchQueue.main.async {
            self.contentView.mainTable.reloadData()
        }
    }
}

extension MainViewController: MainViewDelegate {

}
