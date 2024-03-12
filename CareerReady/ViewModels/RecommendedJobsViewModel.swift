//
//  RecommendedJobs.swift
//  CareerReady
//
//  Created by Sanjay Kumar T S on 4/2/24.
//

import Foundation
import Combine

class RecommendedJobsViewModel: ObservableObject {
    @Published var segments: [String]
    @Published var selectedSegment: String = ""
    @Published var jobs: [Job] = []
    
    private var cancellables = Set<AnyCancellable>()
    private let baseURL = "https://yourapi.com/jobs"
    
    init(segments: [String] = []) {
        self.segments = segments
        if let firstSegment = segments.first {
            self.selectedSegment = firstSegment
            fetchJobs(for: firstSegment)
        }
        
        $selectedSegment
            .sink { [weak self] segment in
                self?.fetchJobs(for: segment)
            }
            .store(in: &cancellables)
    }
    
    func updateSegments(newSegments: [String]) {
        self.segments = newSegments
        if let firstSegment = newSegments.first, firstSegment != self.selectedSegment {
            self.selectedSegment = firstSegment
            fetchJobs(for: firstSegment)
        }
    }
}

extension RecommendedJobsViewModel {
    private func fetchJobs(for segment: String) {
        print("Fetch Job called for: \(segment)")
        guard let url = URL(string: "http://localhost:3000/search-jobs") else { return }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let searchRequest = JobSearchRequest(
            location_city: "New York City",
            location_state: "New York",
            location_coordinates: nil,
            remote_jobs_only: false,
            employment_types: "FULLTIME",
            job_experience_types: "more_than_3_years_experience",
            job_title: segment,
            radius: 150,
            page: 1
        )
        
        do {
            request.httpBody = try JSONEncoder().encode(searchRequest)
        } catch {
            print("Error encoding request: \(error)")
            return
        }

        URLSession.shared.dataTaskPublisher(for: request)
            .map(\.data)
            .decode(type: [Job].self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .replaceError(with: [])
            .sink { [weak self] fetchedJobs in
                self?.jobs = fetchedJobs
            }
            .store(in: &cancellables)
    }
}


