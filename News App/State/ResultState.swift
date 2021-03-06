//
//  ResultState.swift
//  News App
//
//  Created by Dwi Setiawan on 19/05/21.
//

import Foundation
enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
