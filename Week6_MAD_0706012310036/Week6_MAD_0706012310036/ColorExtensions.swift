//
//  ColorExtensions.swift
//  Week6_MAD_0706012310036
//
//  Created by student on 27/03/25.
//

import SwiftUI

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        self.init(red: r, green: g, blue: b)
    }

    func darker(by percentage: Double = 0.2) -> Color {
        var uiColor = UIColor(self)
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 1

        uiColor.getRed(&r, green: &g, blue: &b, alpha: &a)

        return Color(
            red: Double(max(r - CGFloat(percentage), 0)),
            green: Double(max(g - CGFloat(percentage), 0)),
            blue: Double(max(b - CGFloat(percentage), 0)),
            opacity: Double(a)
        )
    }
}
