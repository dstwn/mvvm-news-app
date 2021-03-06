//
//  ArticleView.swift
//  News App
//
//  Created by Dwi Setiawan on 19/05/21.
//

import SwiftUI
import URLImage

struct ArticleView: View {
    let article: Article
    var body: some View {
        HStack{
            if let imgUrl = article.image,
               let url = URL(string: imgUrl){
                URLImage(url){ image in
                    image.resizable().aspectRatio(contentMode: .fill)
                }.environment(\.urlImageOptions, URLImageOptions(
                    maxPixelSize: CGSize(width: 600.0, height: 600.0)
                ))
                .frame(width: 100, height: 100)
                .cornerRadius(10)
            }else {
                PlaceholderImageView()
            }
            VStack(alignment: .leading, spacing: 4, content: {
                Text(article.title ?? "")
                    .foregroundColor(.black)
                    .font(.system(size: 16,weight: .semibold))
                Text(article.source ?? "")
                    .foregroundColor(.gray)
                    .font(.footnote)
            })
        }
    }
}
struct PlaceholderImageView: View {
    var body: some View {
        Image(systemName: "photo.fill")
           .foregroundColor(.white)
           .background(Color.gray)
           .frame(width: 100, height: 100)
    }
}

struct ArticleView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleView(article: Article.dummuyData)
            .previewLayout(.sizeThatFits)
    }
}
