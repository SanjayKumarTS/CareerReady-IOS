//
//  FilterView.swift
//  Project
//
//  Created by Apoorva Mallikarjuna Aradhya on 29/04/24.
//

import SwiftUI

struct EventFilterView: View {
    @Binding var selectedFilter: EventFilter?
    var onFilterSelected: (EventFilter) -> Void
    
    var body: some View {
        NavigationView {
            List {
                ForEach(EventFilter.allCases, id: \.self) { filter in
                    Button(action: {
                        onFilterSelected(filter)
                    }) {
                        HStack {
                            Text(filter.displayName)
                            Spacer()
                            if selectedFilter == filter {
                                Image(systemName: "checkmark")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Filter Options")
        }
    }
}
