//
//  MonthSelectionView.swift
//  YearListSheet
//
//  Created by Nyan Lin Tun on 27/7/25.
//

import SwiftUI

struct MonthSelectionView: View {
    let year: String
    let months: [String]
    let onMonthSelected: (String) -> Void
    var body: some View {
        NavigationView {
            List(months, id: \.self) { month in
                Button {
                    onMonthSelected(month)
                } label: {
                    Text(month)
                }
                .buttonStyle(PlainButtonStyle())
            }
            .navigationTitle("Select Month for \(year)")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MonthSelectionView(
        year: "2000",
        months: [
            "Jan",
            "Feb",
            "Mar"
        ]
    ) { selectedMonth in
        print(
            "Select \(selectedMonth)"
        )
    }
}
