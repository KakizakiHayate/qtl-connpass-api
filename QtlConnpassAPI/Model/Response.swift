//
//  Responce.swift
//  QtlConnpassAPI
//
//  Created by 柿崎逸 on 2023/05/19.
//

import Foundation

struct Response: Decodable {
    var events: [Events]
}
