//
//  EventModel.swift
//  ConnpassShowList
//
//  Created by 柿崎逸 on 2023/03/26.
//

import Foundation

struct Events: Decodable, Identifiable {
    var id = UUID()
    var title: String
    var catchCopy: String
    var eventURL: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case catchCopy = "catch"
        case eventURL = "event_url"
    }

}

