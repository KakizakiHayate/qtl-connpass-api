//
//  ListViewModel.swift
//  QtlConnpassAPI
//
//  Created by 柿崎逸 on 2023/04/25.
//

import Foundation

class APIResultViewModel: ObservableObject {
    // MARK: - Property Wrappers
    @Published var events = [Events]()
    @Published var isSearchAlert = false
    
    ///通信
    func fetchAPIData(keyword: String) async throws {
        
        if let url = URL(string: "https://connpass.com/api/v1/event/?keyword=\(keyword)") {
            print(url)
            let (data, _) = try await URLSession.shared.data(from: url)
            print(data)
            let eventsObject = try JSONDecoder().decode(Response.self, from: data)
            DispatchQueue.main.async {
                self.events = eventsObject.events
            }
        } else {
            print("decode error")
            throw FetcherError.badCode
        }
    }
}
