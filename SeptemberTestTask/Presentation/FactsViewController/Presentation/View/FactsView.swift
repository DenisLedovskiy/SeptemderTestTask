import UIKit

protocol FactsViewDelegate: AnyObject {}

class FactsView: UIView {

    // MARK: - properties

    weak var delegate: FactsViewDelegate?

    // MARK: - views

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Design.Font.h2
        label.textColor = Design.Color.black
        label.numberOfLines = 0
        label.text = "Random fact"
        return label
    }()

    private lazy var factLabel: UILabel = {
        let label = UILabel()
        label.font = Design.Font.h1
        label.textColor = Design.Color.black
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
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
        // MARK: - Add Subviews
        addSubview(titleLabel)
        addSubview(factLabel)

        // MARK: - Add Constraints
        setupConstraintsForTitleLabel()
        setupConstraintsForFactLabel()
    }


    // MARK: - methods
    func setFact(_ text: String) {
        factLabel.text = text
    }
}

// MARK: - constraits extensions
extension FactsView {

    private func setupConstraintsForTitleLabel() {
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
        }
    }

    private func setupConstraintsForFactLabel() {
        factLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().inset(16)
        }
    }
}
