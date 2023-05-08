//
//  MyBadgeView.swift
//  NetflixInstagram
//
//  Created by 변재은 on 2023/05/08.
//

import UIKit

final class MyBadgeView: UICollectionReusableView {
  private let button: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "plus"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.clipsToBounds = true

    self.addSubview(button)
    NSLayoutConstraint.activate([
      self.button.centerXAnchor.constraint(equalTo: self.centerXAnchor),
      self.button.centerYAnchor.constraint(equalTo: self.centerYAnchor),
      self.button.widthAnchor.constraint(equalToConstant: 25),
      self.button.heightAnchor.constraint(equalToConstant: 25),
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("Not implemented")
  }
}
