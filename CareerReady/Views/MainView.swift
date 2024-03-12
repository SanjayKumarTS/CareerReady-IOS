//
//  MainView.swift
//  CareerReady
//
//  Created by Sanjay Kumar T S on 3/13/24.
//

import SwiftUI

struct MainView:View {
    var body: some View{
        NavigationStack{
            TabView(content: {
                HomeScreenView()
                    .tabItem {
                        Label(
                            title: { Text("Home") },
                            icon: { Image(systemName: "house.fill") }
                        )
                    }
                ArticlesListView()
                    .tabItem {
                        Label(
                            title: { Text("Jobs") },
                            icon: { Image(systemName: "bookmark.fill") }
                        )
                    }
                ArticlesListView()
                    .tabItem {
                        Label(
                            title: { Text("Interview Prep") },
                            icon: { Image(systemName: "wand.and.stars") }
                        )
                    }
                ArticlesListView()
                    .tabItem {
                        Label(
                            title: { Text("Events") },
                            icon: { Image(systemName: "calendar.badge.plus") }
                        )
                    }
            })
        }
    }
}

#Preview {
    MainView()
}
