import Foundation
import UIKit

class CustomTextField: UITextField {

    // MARK: - properties

    let padding = UIEdgeInsets(top: 0,
                               left: 16,
                               bottom: 0,
                               right: 16)

    // MARK: - views


    // MARK: - overrides

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

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
        layer.borderWidth = 2
        layer.borderColor = Design.Color.black.cgColor
        layer.cornerRadius = 10
        tintColor = Design.Color.black

        // MARK: - Add Subviews

        // MARK: - Add Constraints
        setupConstraintsForSelf()
    }
}

// MARK: - sizes extensions

extension CustomTextField {

    func setupConstraintsForSelf() {
        snp.makeConstraints { make in
            make.height.equalTo(60)
        }
    }
}
