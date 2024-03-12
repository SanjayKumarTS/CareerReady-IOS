//
//  InterviewPrep.swift
//  CareerReady
//
//  Created by Sanjay Kumar T S on 4/6/24.
//

import Foundation

class InterviewPrepViewModel: ObservableObject{
    @Published var preps: [Prep] = []

        init() {
            loadPreps()
        }

        private func loadPreps() {
            // Sample data
            self.preps = [
                Prep(question: "How are you", answer: "I'm Fine"),
                Prep(question: "How are you", answer: "I'm Fine")
                // Add more Prep items as needed
            ]
        }
}

struct Prep: Codable{
    var question: String
    var answer: String
    
    init(question: String, answer: String) {
        self.question = question
        self.answer = answer
    }
}
