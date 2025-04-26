//
//  MoodLogView.swift
//  Week6_MAD_0706012310036
//
//  Created by student on 27/03/25.
//


import SwiftUI

struct MoodLogView: View {
    @ObservedObject var viewModel: MoodLogViewModel

    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    ForEach(viewModel.groupedEntries(), id: \.date) { group in
                        VStack(alignment: .center, spacing: 4) {
                            Text(group.date, style: .date)
                                .font(.headline)
                                .padding(.top)

                            ForEach(group.entries) { entry in
                                MoodEntryCard(entry: entry)
                            }
                        }
                        .padding(.horizontal)
                    }
                }

                NavigationLink(destination: AddMoodView(onSubmit: { entry in
                    viewModel.entries.append(entry)
                })) {
                    Text("LOG MY MOOD")
                        .bold()
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }

                .padding(.bottom)
            }
            .navigationTitle("Daily Mood Tracker")
        }
    }
}

struct MoodEntryCard: View {
    let entry: MoodEntry

    var body: some View {
        let backgroundColor = Color(hex: entry.mood.colorHex)
        let borderColor = backgroundColor.darker(by: 0.15)

        return VStack(alignment: .leading, spacing: 4) {
            Text("\(entry.mood.emoji) \(entry.mood.rawValue.capitalized)")
                .font(.headline)

            Text("Note: *\(entry.note)*")
                .italic()

            Text("Logged on \(formattedDate(entry.timeLogged))")
                .font(.caption)
                .foregroundColor(.gray)

        }
        .frame(width: 350, height: 100, alignment: .leading)
        .padding()
        .background(backgroundColor)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(borderColor, lineWidth: 2)
        )
    }
    private func formattedDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }

}



#Preview {
    let mockViewModel = MoodLogViewModel()
    return MoodLogView(viewModel: mockViewModel)
}

