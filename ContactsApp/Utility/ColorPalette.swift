//
//  ColorPalette.swift
//  ContactsApp
//
//  Created by Nikhil on 02/12/19.
//  Copyright © 2019 Nikhil. All rights reserved.
//

import Foundation
import SwiftUI
struct ColorPalette {
    static let imageBorderColor = Color.init(red: 151, green: 151, blue: 151)
    static let primaryColor: Color = #colorLiteral(red: 0.3541404009, green: 0.8892813325, blue: 0.7923948169, alpha: 1).color
    static let lightGrayColor = #colorLiteral(red: 0.6313021779, green: 0.6314131618, blue: 0.6312951446, alpha: 1).color
    static let primaryTextColor = #colorLiteral(red: 0.290160656, green: 0.2902164459, blue: 0.2901571095, alpha: 1).color
    static let whiteColor = Color.white
    static let gradientEndColor = #colorLiteral(red: 0.3541404009, green: 0.8892813325, blue: 0.7923948169, alpha: 1).color
}
extension UIColor {
    var color: Color {
        get {
            let rgbColours = self.cgColor.components
            return Color(
                red: Double(rgbColours![0]),
                green: Double(rgbColours![1]),
                blue: Double(rgbColours![2])
            )
        }
    }
}
