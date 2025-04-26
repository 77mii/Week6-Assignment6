//
//  MoodType.swift
//  Week6_MAD_0706012310036
//
//  Created by student on 27/03/25.
//


import Foundation

enum MoodType: String, Codable {
    case happy
    case neutral
    case sad

    var emoji: String {
        switch self {
        case .happy: return "😊"
        case .neutral: return "😐"
        case .sad: return "😢"
        }
    }

    var colorHex: String {
        switch self {
        case .happy: return "#D4F6D2"
        case .neutral: return "#FFF4CC"
        case .sad: return "#FFD6D6"
        }
    }
}

