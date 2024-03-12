//
//  SearchJobs.swift
//  CareerReady
//
//  Created by Sanjay Kumar T S on 4/3/24.
//

import Foundation

class SearchJobs: ObservableObject {
    @Published var jobs: [Job] = []
    @Published var searchText = ""

    init() {
        fetchJobs(searchText: "")  // Initially fetch all jobs or an empty set
    }
    
    func fetchJobs(searchText: String) {
        print("Search Called")
        var allJobs = [Job]()
        // Simulating a backend fetch based on searchText
        // In a real app, this would be an API call
        for i in 0..<4 {
            allJobs += Job.sampleJobsData.map {
                var job = $0
                job.id = "\(job.id)-\(i)"  // Assuming each job has an `id` property and it's a String
                return job
            }
        }

        if searchText.isEmpty {
            self.jobs = Array(allJobs.prefix(10))  // or some other logic to get the initial set of jobs
        } else {
            // Placeholder for filtering logic - replace with actual API call response
            self.jobs = allJobs.filter { $0.jobTitle!.contains(searchText) }
        }
    }

}

