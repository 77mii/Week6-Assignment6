//
//  MoodEntry.swift
//  Week6_MAD_0706012310036
//
//  Created by student on 27/03/25.
//
import Foundation

struct MoodEntry: Identifiable, Codable {
    let id = UUID()
    let date: Date
    let mood: MoodType
    let note: String
    let timeLogged: Date
}
