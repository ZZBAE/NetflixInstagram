//
//  Extensions.swift
//  Netflix+Instagram
//
//  Created by 변재은 on 2023/04/24.
//

import Foundation

extension String {
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
