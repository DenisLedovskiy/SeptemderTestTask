import UIKit

class MainTableCell: BaseUITableViewCell {

    // MARK: - views
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Design.Font.t1
        label.textColor = Design.Color.black
        label.numberOfLines = 0
        return label
    }()

    // MARK: - overrides
    override func setup() {
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        contentView.backgroundColor = Design.Color.white
        configureConstraints()
    }

    // MARK: - methods
    func configure(_ text: String) {
        titleLabel.text = text
    }
}

extension MainTableCell {
    private func configureConstraints() {

        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.right.equalToSuperview().inset(16)
        }

//        if let lastSubview = self.contentView.subviews.last {
//        //            self.contentView.bottomAnchor.constraint(equalTo: lastSubview.bottomAnchor, constant: 10).isActive = true
//        //        }

        self.contentView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
    }
}
