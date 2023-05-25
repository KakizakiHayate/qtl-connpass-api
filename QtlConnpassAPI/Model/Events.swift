//
//  EventModel.swift
//  ConnpassShowList
//
//  Created by 柿崎逸 on 2023/03/26.
//

import Foundation

struct Events: Decodable, Identifiable {
    let id = UUID()
    let title: String
    let catchCopy: String
    let eventURL: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case catchCopy = "catch"
        case eventURL = "event_url"
    }

}

