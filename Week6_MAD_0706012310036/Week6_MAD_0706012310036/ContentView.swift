//
//  ContentView.swift
//  Week6_MAD_0706012310036
//
//  Created by student on 27/03/25.
//

import SwiftUI
struct ContentView: View {
    @StateObject private var viewModel = MoodLogViewModel()
    var body: some View {
        TabView {
            MoodLogView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "book")
                    Text("Mood Log")
                }

            MonthlyReportView(viewModel: viewModel)
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Report")
                }
        }
    }
}

#Preview {
    ContentView()
}
