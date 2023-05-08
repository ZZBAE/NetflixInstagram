//
//  Section.swift
//  NetflixInstagram
//
//  Created by 변재은 on 2023/05/08.
//

import Foundation

enum MySection {
  struct MainItem {
    let text: String
  }
  struct SubItem {
    let text: String
  }

  case main([MainItem])
  case sub([SubItem])
}
