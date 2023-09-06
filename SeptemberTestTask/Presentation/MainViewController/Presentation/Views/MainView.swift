import UIKit

protocol MainViewDelegate: AnyObject {}

class MainView: UIView {

    // MARK: - properties

    weak var delegate: MainViewDelegate?
    var isErrorHide = true

    // MARK: - views

    lazy var textField: CustomTextField = {
        let textField = CustomTextField()
        textField.placeholder = "Введите текст"
        return textField
    }()

    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.text = "Вы ничего не ввели!"
        label.textColor = Design.Color.red
        label.font = Design.Font.error
        return label
    }()

    lazy var saveButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Design.Color.black
        let attributedString = NSAttributedString(string: "Save",
                                                  attributes: [NSAttributedString.Key.foregroundColor : Design.Color.white,
                                                               NSAttributedString.Key.font : Design.Font.button1])
        button.setAttributedTitle(attributedString, for: .normal)
        button.layer.cornerRadius = 10
        return button
    }()

    lazy var mainTable: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.backgroundColor = Design.Color.white
        tableView.delegate = self
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .singleLine
        MainTableCell.register(tableView)
        return tableView
    }()

    // MARK: - overrides

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    private func setup() {
        backgroundColor = Design.Color.white
        setTapGestureRecognizer()
        // MARK: - Add Subviews
        addSubview(textField)
        addSubview(saveButton)
        addSubview(mainTable)

        // MARK: - Add Constraints
        setupConstraintsForTextField()
        setupConstraintsForSaveButton()
        setupConstraintsForMainTable()
    }


    // MARK: - methods

    func clearTextField() {
        textField.text = ""
    }

    func setErrorState() {
        textField.layer.borderColor = Design.Color.red.cgColor
        addSubview(errorLabel)
        errorLabel.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(4)
            make.left.equalTo(textField.snp.left)
        }
        isErrorHide = false
    }

    func hideErrorState() {
        textField.layer.borderColor = Design.Color.black.cgColor
        errorLabel.snp.removeConstraints()
        errorLabel.removeFromSuperview()
        isErrorHide = true
    }
}

// MARK: - constraits extensions

extension MainView {

    private func setupConstraintsForTextField() {
        textField.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(80)
        }
    }

    private func setupConstraintsForSaveButton() {
        saveButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.right.equalToSuperview().inset(16)
            make.size.equalTo(60)
        }
    }

    func setupConstraintsForMainTable() {
        mainTable.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(20)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

//MARK: - UITableViewDelegate
extension MainView: UITableViewDelegate {}

//MARK: - TapGesture
extension MainView {
    private func setTapGestureRecognizer() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(tapFunc))
        tapScreen.cancelsTouchesInView = false
        self.addGestureRecognizer(tapScreen)
    }

    @objc
    private func tapFunc() {
        self.endEditing(true)
    }
}
