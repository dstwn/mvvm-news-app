//
//  NewsEndpoint.swift
//  News App
//
//  Created by Dwi Setiawan on 19/05/21.
//

import Foundation

protocol APIBuilder {
    var urlRequest: URLRequest{get}
    var baseURL: URL{get}
    var path: String{get}
}
enum NewsAPI {
    case getNews
}
extension NewsAPI: APIBuilder {
    var urlRequest: URLRequest {
        return URLRequest(url: self.baseURL.appendingPathComponent(self.path))
    }
    
    var baseURL: URL {
        switch self {
        case .getNews:
            return URL(string: "https://api.lil.software")!
        }
    }
    
    var path: String {
        return "/news"
    }
    
    
}
