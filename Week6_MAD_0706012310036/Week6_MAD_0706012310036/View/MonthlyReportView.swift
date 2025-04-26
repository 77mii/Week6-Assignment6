//
//  MonthlyReportView.swift
//  Week6_MAD_0706012310036
//
//  Created by student on 27/03/25.
//


import SwiftUI

struct MonthlyReportView: View {
    @ObservedObject var viewModel: MoodLogViewModel

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(viewModel.groupedEntriesByMonth(), id: \.monthYear) { group in
                        VStack(alignment: .center, spacing: 4) {
                            Text(group.monthYear)
                                .font(.headline)
                                .padding(.top)

                            ForEach(group.entries) { entry in
                                MoodEntryCard(entry: entry)
                            }
                        }
                        .padding(.horizontal)
                    }
                }
                .padding(.top)
            }
            .navigationTitle("Monthly Mood Log")
        }
    }
}

#Preview {
    let mockViewModel = MoodLogViewModel()
    return MonthlyReportView(viewModel: mockViewModel)
}
