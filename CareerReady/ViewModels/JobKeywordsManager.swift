//
//  JobDetailsController.swift
//  CareerReady
//
//  Created by Sanjay Kumar T S on 4/28/24.
//

import Foundation


class JobKeywordsManager {
    static let shared = NetworkManager()

    func fetchKeywords(for description: String, completion: @escaping ([String]?, Error?) -> Void) {
        guard let url = URL(string: "http://127.0.0.1:5000/extract-keywords") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let body: [String: Any] = ["description": description]
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                DispatchQueue.main.async {
                    completion(nil, error)
                }
                return
            }

            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                    let keywords = json?["keywords"] as? [String] ?? []
                    DispatchQueue.main.async {
                        completion(keywords, nil)
                    }
                } catch {
                    DispatchQueue.main.async {
                        completion(nil, error)
                    }
                }
            }
        }.resume()
    }
}
