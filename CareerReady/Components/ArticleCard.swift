//
//  ArticleCard.swift
//  CareerReady
//
//  Created by Sanjay Kumar T S on 3/13/24.
//

import SwiftUI

struct ArticleCard:View {
    var article: Article
    var body: some View{
        VStack(alignment: .leading, content: {
            AsyncImage(url: URL(string: article.urlToImage)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200,height: 150)
                        .clipShape(.rect(cornerRadius: 10))
                case .failure:
                    Image(systemName: "photo")
                        .frame(width: 200, height: 150)
                @unknown default:
                    EmptyView()
                }
            }
            HStack(content: {
                Text("By \(article.source)")
                    .font(.caption2)
                    .bold()
                    .foregroundStyle(.secondary)
                Spacer()
                Text(timeSince(from: article.publishedAt))
                    .font(.caption2)
                    .bold()
                    .foregroundStyle(.secondary)
            })
            Text(article.title)
                .font(.subheadline.bold())
                .lineLimit(2)
                .fixedSize(horizontal: false, vertical: true)
        })
        .padding()
        .frame(width: 220, alignment: .leading)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemBackground))
                .shadow(color: .secondary.opacity(0.2), radius: 5, x: 0, y: 5)
        )
    }
}

#Preview {
    ArticleCard(article: Article.sampleData[0])
}
