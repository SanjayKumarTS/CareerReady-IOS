//
//  HomeScreenView.swift
//  CareerReady
//
//  Created by Sanjay Kumar T S on 3/12/24.
//

import SwiftUI

struct HomeScreenView:View {
    let profileImageUrl = "https://lh3.googleusercontent.com/a/ACg8ocL9ljVX9-Suy6KnDrTIOo2ZvihpzSHBjLfx4Yx56h2EQA=s192-c-mo"
    let recommendedJobs = Job.sampleJobsData
    let articles = Article.sampleData
    let cardColors: [Color] = [.purple, .green, .indigo]
    var body: some View{
        VStack{
            LazyVStack(alignment: .leading,content: {
                HStack(content: {
                    Text("Discover your dream job")
                        .font(.largeTitle).bold()
                    Spacer()
                    NavigationLink(destination:{
                        UserProfileView()
                    }) {
                        ProfileIconView(profileImageUrl: profileImageUrl)
                    }
                })
                .padding()
                
                NavigationLink(destination: SearchPageView()){
                    HStack(content: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        Text("Search")
                            .font(.headline).bold().padding(.vertical)
                            .foregroundStyle(.gray)
                        Spacer()
                    })
                    .padding(.horizontal)
                    .frame(minWidth: 300)
                    .frame(maxWidth: 500)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(.systemBackground))
                            .shadow(color: .secondary.opacity(0.4), radius: 10, x: 0, y: 2)
                    )
                    .padding(.horizontal)
                }
                
                HStack(alignment: .bottom,content: {
                    Text("Jobs for you")
                        .font(.headline)
                        .bold()
                    Spacer()
                    NavigationLink {
                        RecommendedJobsView(viewModel: SegmentedViewModel(segments: ["Software Development", "Web Development", "Mobile Development","Cloud Computing","Agile Development"]))
                    } label: {
                        Text("See All")
                            .font(.subheadline)
                            .underline()
                    }
                })
                .padding([.top,.horizontal])
                
                ScrollView(.horizontal, content: {
                    LazyHStack(content: {
                        ForEach(recommendedJobs.indices, id: \.self) { index in
                            JobCard(job: recommendedJobs[index], backgroundColor: cardColors[index % cardColors.count])
                        }
                    })
                    .padding(.horizontal)
                })
                .scrollIndicators(.hidden)
                
                HStack(content: {
                    Text("Articles for you")
                        .font(.headline)
                        .bold()
                    Spacer()
                    NavigationLink {
                        ArticlesListView()
                    } label: {
                        Text("See All")
                            .font(.subheadline)
                            .underline()
                    }
                })
                .padding([.top,.horizontal])
                
                ScrollView(.horizontal, content: {
                    LazyHStack(content: {
                        ForEach(articles.indices, id: \.self) { index in
                            ArticleCard(article: articles[index])
                        }
                    })
                    .padding([.horizontal, .bottom])
                })
                .scrollIndicators(.hidden)
            })
            NavigationLink(destination: UploadPDFView(), label: {
                Text("Upload PDF")
            })
        }
        .frame(maxHeight: .infinity, alignment: .topLeading)
    }
    
}

#Preview {
    HomeScreenView()
}
