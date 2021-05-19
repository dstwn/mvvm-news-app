//
//  HomeView.swift
//  News App
//
//  Created by Dwi Setiawan on 19/05/21.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.openURL) var openUrl
    @StateObject var viewModel = NewsViewModelImplementation(
        service: NewsServiceImplementation()
    )
    var body: some View {
        Group{
            switch viewModel.state {
            case .loading :
                ProgressView()
            case .failed(let error) :
                ErrorView(error: error, handler: viewModel.getArticles)
            case .success(let articles):
                NavigationView{
                    List(articles) {item in
                        ArticleView(article: item)
                            .onTapGesture {
                                load(url: item.url)
                            }
                    }
                    .navigationTitle(Text("News"))
                }
            }
        }.onAppear(perform: viewModel.getArticles)
    }
    func load(url: String?){
        guard let link = url,
              let url = URL(string: link) else {return}
        openUrl(url)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
