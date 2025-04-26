//
//  AddMoodView.swift
//  Week6_MAD_0706012310036
//
//  Created by student on 27/03/25.
//


import SwiftUI

struct AddMoodView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var selectedMood: MoodType? = nil
    @State private var note: String = ""

    var onSubmit: ((MoodEntry) -> Void)? = nil

    var body: some View {
        VStack(spacing: 20) {
            Text("Daily Mood Entry")
                .font(.title)
                .bold()

            Text("Select your mood:")
                .font(.subheadline)

            HStack(spacing: 12) {
                MoodButton(mood: .happy, selectedMood: $selectedMood)
                MoodButton(mood: .neutral, selectedMood: $selectedMood)
                MoodButton(mood: .sad, selectedMood: $selectedMood)
            }

            TextEditor(text: $note)
                .frame(height: 100)
                .padding(4)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                )
                .padding(.horizontal)

            Button(action: submitMood) {
                Text("Submit")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(selectedMood != nil ? Color.blue : Color.gray.opacity(0.3))
                    .cornerRadius(10)
            }
            .disabled(selectedMood == nil)
            .padding(.horizontal)

            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Cancel")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.red)
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            Spacer()
        }
        .padding(.top)
    }

    private func submitMood() {
        guard let mood = selectedMood else { return }

        let entry = MoodEntry(
            date: Date(),
            mood: mood,
            note: note,
            timeLogged: Date()
        )

        onSubmit?(entry)
        presentationMode.wrappedValue.dismiss()
    }
}

struct MoodButton: View {
    let mood: MoodType
    @Binding var selectedMood: MoodType?

    var isSelected: Bool {
        selectedMood == mood
    }

    var body: some View {
        Button(action: {
            selectedMood = mood
        }) {
            HStack {
                Text(mood.emoji)
                Text(mood.rawValue.capitalized)
                    .font(.subheadline)
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(isSelected ? Color.blue.opacity(0.2) : Color.gray.opacity(0.1))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
            )
        }
    }
}

#Preview {
    AddMoodView(onSubmit: { _ in })
}
