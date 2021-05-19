//
//  APIError.swift
//  News App
//
//  Created by Dwi Setiawan on 19/05/21.
//

import Foundation
enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}
extension APIError: LocalizedError {
    var errorDescription: String?{
        switch self {
        case .decodingError:
            return "Failed to decode the object from theb service"
        case .errorCode(let code):
            return "\(code) - Something went wrong"
        case .unknown:
            return "Error is unknown"
        }
    }
}
