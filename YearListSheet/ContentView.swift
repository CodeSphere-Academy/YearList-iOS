//
//  ContentView.swift
//  YearListSheet
//
//  Created by Nyan Lin Tun on 27/7/25.
//

import SwiftUI

struct ContentView: View {
    let years = Array(2000...2025).map { String($0) }
    let months = [
        "January",
        "February",
        "March",
        "April",
        "May",
        "June",
        "July",
        "August",
        "September",
        "October",
        "November",
        "December"
    ]
    @State var selectedItem = [String]()
    @State var selectedYear = ""
    @State var showingMonthSheet = false
    var body: some View {
        NavigationView {
            List {
                if !selectedItem.isEmpty {
                    Section("Selected") {
                        ForEach(selectedItem, id: \.self) { item in
                            Text(item)
                        }
                    }
                }
                Section("Years") {
                    ForEach(years, id: \.self) { year in
                        Button(action: {
                            selectedYear = year
                            showingMonthSheet = true
                        }) {
                            HStack {
                                Text(year)
                                Spacer()
                            }
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .navigationTitle("Years")
            .sheet(isPresented: $showingMonthSheet) {
            } content: {
                MonthSelectionView(year: self.selectedYear,
                                   months: months) { month in
                    let yearMonth = "\(selectedYear) - \(month)"
                    selectedItem.append(yearMonth)
                    showingMonthSheet = false
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
