//
//  MoodLogViewModel.swift
//  Week6_MAD_0706012310036
//
//  Created by student on 27/03/25.
//


import Foundation

class MoodLogViewModel: ObservableObject {
    @Published var entries: [MoodEntry] = []

    init() {
        loadMockData()
    }

    func groupedEntries() -> [(date: Date, entries: [MoodEntry])] {
        let grouped = Dictionary(grouping: entries) {
            Calendar.current.startOfDay(for: $0.date)
        }

        return grouped
            .map { ($0.key, $0.value.sorted { $0.timeLogged > $1.timeLogged }) }
            .sorted { $0.0 > $1.0 }
    }

    private func loadMockData() {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"

        entries = [
            MoodEntry(date: formatter.date(from: "2025/03/21 08:00")!,
                      mood: .happy,
                      note: "Great walk outside!",
                      timeLogged: formatter.date(from: "2025/03/21 08:00")!),

            MoodEntry(date: formatter.date(from: "2025/03/20 12:00")!,
                      mood: .neutral,
                      note: "Just an okay day.",
                      timeLogged: formatter.date(from: "2025/03/20 12:00")!),

            MoodEntry(date: formatter.date(from: "2025/02/28 17:00")!,
                      mood: .happy,
                      note: "Finished a big task!",
                      timeLogged: formatter.date(from: "2025/02/28 17:00")!),
            MoodEntry(date: formatter.date(from: "2025/01/25 10:00")!,
                      mood: .sad,
                      note: "Had a rough night.",
                      timeLogged: formatter.date(from: "2025/02/27 10:00")!),
        ]
    }
    func groupedEntriesByMonth() -> [(monthYear: String, entries: [MoodEntry])] {
        let grouped = Dictionary(grouping: entries) { entry in
            let formatter = DateFormatter()
            formatter.dateFormat = "MMMM yyyy"
            return formatter.string(from: entry.date)
        }

        return grouped
            .map { ($0.key, $0.value.sorted { $0.timeLogged > $1.timeLogged }) }
            .sorted { lhs, rhs in
                let formatter = DateFormatter()
                formatter.dateFormat = "MMMM yyyy"
                guard let lhsDate = formatter.date(from: lhs.0),
                      let rhsDate = formatter.date(from: rhs.0) else {
                    return false
                }
                return lhsDate > rhsDate
            }
    }

}
