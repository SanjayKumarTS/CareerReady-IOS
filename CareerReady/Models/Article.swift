//
//  Article.swift
//  CareerReady
//
//  Created by Sanjay Kumar T S on 3/13/24.
//

import Foundation

struct Article:Codable, Identifiable {
    var id = UUID()
    var source: String
    var title: String
    var description: String
    var url: String
    var urlToImage: String
    var publishedAt: String
}

extension Article{
    static let sampleData:[Article] = [
        Article(source: "The Next Web",
                title: "5 ways to boost your salary as a software developer in 2024",
                description: "For much of the 21st century, software development has been an attractive career option. Now, however, there are perceived threats on the horizon as new tools seem set to fill the software development skills gap. Generative AI models are evolving quickly with…",
                url: "https://thenextweb.com/news/5-ways-boost-salary-software-developer-2024",
                urlToImage:"https://img-cdn.tnwcdn.com/image/tnw-blurple?filter_last=1&fit=1280%2C640&url=https%3A%2F%2Fcdn0.tnwcdn.com%2Fwp-content%2Fblogs.dir%2F1%2Ffiles%2F2024%2F03%2FUntitled-design-7.jpg&signature=0974f38806f9a4847822b9d42964a3a5",
                publishedAt: "2024-02-22T18:00:00Z"),
        Article(source: "ReadWrite",
                title: "The NSA list of memory-safe programming languages has been updated",
                description: "The US government says it would be better for them if you ceased using C or C++ when programming tools. […]\nThe post The NSA list of memory-safe programming languages has been updated appeared first on ReadWrite.",
                url: "https://readwrite.com/the-nsa-list-of-memory-safe-programming-languages-has-been-updated/",
                urlToImage:"https://readwrite.com/wp-content/uploads/2024/03/NSA-list-of-memory-safe-programming.jpg",
                publishedAt: "2024-02-27T12:58:08Z"),
        Article(source: "Fox News",
                title: "The creepy-eyed robot that wants to be your friend and teacher",
                description: "Doly the creepy-eyed robot was created by Limibit of Ontario, Canada, and can help users learn coding, robotics and artificial intelligence.",
                url: "https://www.foxnews.com/tech/creepy-eyed-robot-wants-to-be-your-friend-teacher",
                urlToImage:"https://static.foxnews.com/foxnews.com/content/uploads/2024/02/4-The-creepy-eyed-robot-that-wants-to-be-your-friend-and-teacher.jpg",
                publishedAt:"2024-02-25T21:09:21Z")
    ]
}
