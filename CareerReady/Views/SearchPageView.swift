//
//  SearchPageView.swift
//  CareerReady
//
//  Created by Sanjay Kumar T S on 3/13/24.
//

import SwiftUI

struct SearchPageView:View {
    @ObservedObject var viewModel: SearchJobs = SearchJobs()
    @State private var isSearchPresented = true
    
    var body: some View {
        NavigationStack {
            List(viewModel.jobs, id: \.id) { job in
                NavigationLink {
                    JobDetailsView(job: job)
                } label: {
                    JobItem(job: job)
                }
            }
            .searchable(text: $viewModel.searchText, isPresented: $isSearchPresented)
            .onSubmit(of: .search) {
                viewModel.fetchJobs(searchText: viewModel.searchText)
            }
            .navigationTitle("Search Jobs")
            .onAppear {
                self.isSearchPresented = true
            }
        }
    }
}

#Preview {
    SearchPageView()
}
