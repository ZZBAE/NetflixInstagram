//
//  InstaStoryCell.swift
//  NetflixInstagram
//
//  Created by 변재은 on 2023/04/29.
//

import UIKit

final class InstaStoryCell: UICollectionViewCell {
    let label: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    required init(coder: NSCoder) {
        fatalError()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = UIColor.blue
        self.contentView.addSubview(self.label)
        NSLayoutConstraint.activate([
            self.label.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor),
            self.label.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor),
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
