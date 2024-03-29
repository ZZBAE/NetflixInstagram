//
//  InstaStoryCell.swift
//  NetflixInstagram
//
//  Created by 변재은 on 2023/04/29.
//

import UIKit

final class InstaStoryCell: UICollectionViewCell {
    static let id = "InstaStoryCell"

    // MARK: UI
    private lazy var label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(label)
        return label
    }()

    private var randomValue: CGFloat {
        CGFloat(drand48())
    }

    // MARK: Initializer
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        self.layer.cornerRadius = layer.bounds.width / 2
        self.backgroundColor = UIColor(red: self.randomValue, green: self.randomValue, blue: self.randomValue, alpha: 1.0)

        NSLayoutConstraint.activate([
            self.label.leftAnchor.constraint(equalTo: self.contentView.leftAnchor, constant: 16),
            self.label.rightAnchor.constraint(equalTo: self.contentView.rightAnchor, constant: -16),
            self.label.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
            self.label.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
        ])
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        self.prepare(text: "")
    }

    func prepare(text: String) {
        self.label.text = text
    }
}
