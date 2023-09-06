import UIKit
import WebKit

protocol OneButtonViewDelegate: AnyObject {}

class OneButtonView: UIView {

    // MARK: - properties

    weak var delegate: OneButtonViewDelegate?

    // MARK: - views

    lazy var googleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = Design.Color.black
        let attributedString = NSAttributedString(string: "Go Google",
                                                  attributes: [NSAttributedString.Key.foregroundColor : Design.Color.white,
                                                               NSAttributedString.Key.font : Design.Font.button1])
        button.setAttributedTitle(attributedString, for: .normal)
        button.layer.cornerRadius = 20
        return button
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
        addSubview(googleButton)

        // MARK: - Add Constraints
        setupConstraintsForGoogleButton()
    }

    // MARK: - methods

}

// MARK: - constraits extensions

extension OneButtonView {
    private func setupConstraintsForGoogleButton() {
        googleButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.size.equalTo(150)
        }
    }
}

