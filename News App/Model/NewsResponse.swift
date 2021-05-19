//
//  NewsResponse.swift
//  News App
//
//  Created by Dwi Setiawan on 19/05/21.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title: String?
    let articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title
        case articleDescription = "description"
        case image, date
    }
}
extension Article{
    static var dummuyData: Article{
        .init(
            author: "Jack Maloney",
                  url: "https://www.cbssports.com/nba/news/celtics-vs-wizards-score-takeaways-jayson-tatum-drops-50-in-bostons-play-in-game-win-to-clinch-no-7-seed/live/",
                  source: "CBS Sports",
                  title: "Celtics vs. Wizards score, takeaways: Jayson Tatum drops 50 in Boston's play-in game win to clinch No. 7 seed - CBSSports.com",
            articleDescription: "Washington will now face Indiana to determine the No. 8 seed",
            image: "https://sportshub.cbsistatic.com/i/r/2021/05/19/60252e52-9b2f-4aee-9694-bc09b3a0717c/thumbnail/1200x675/cb33ca27f9128131387faaf39e26f21f/untitled-design-2021-05-18t222149-090.png",
            date: Date()
        )
    }
}
