//
//  ProfileIconView.swift
//  CareerReady
//
//  Created by Sanjay Kumar T S on 3/12/24.
//

import SwiftUI

struct ProfileIconView: View {
    let width: CGFloat
        let height: CGFloat
    init(profileImageUrl: String?, width: CGFloat = 50, height: CGFloat = 50) {
            self.profileImageUrl = profileImageUrl
            self.width = width
            self.height = height
        }
    let profileImageUrl: String?
    var body: some View{
        if let urlString = profileImageUrl, let url = URL(string: urlString) {
            AsyncImage(url: url) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: width, height: height)
                        .clipShape(.rect(cornerRadius: 10))
                case .failure:
                    Image(systemName: "photo")
                        .frame(width: width, height: height)
                @unknown default:
                    EmptyView()
                }
            }
        } else {
            Image(systemName: "photo")
                .frame(width: width, height: height)
        }
    }
}

#Preview {
    ProfileIconView(profileImageUrl: "https://lh3.googleusercontent.com/a/ACg8ocL9ljVX9-Suy6KnDrTIOo2ZvihpzSHBjLfx4Yx56h2EQA=s192-c-mo")
}
