//
//  AppError.swift
//  QtlConnpassAPI
//
//  Created by 柿崎逸 on 2023/05/25.
//

import Foundation

enum FetcherError: Error {
    case badURL
    case badCode
    case missingData
}
