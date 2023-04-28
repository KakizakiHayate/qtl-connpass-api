//
//  ListViewModel.swift
//  QtlConnpassAPI
//
//  Created by 柿崎逸 on 2023/04/25.
//

import Foundation

class ListViewModel: ObservableObject {
    // MARK: - Property Wrappers
    @Published var events = [Events]()
    // MARK: - Property Wrappers
    @Published var isSearchAlert = false

    // 通信
    func loadEventData(keyword: String) {
        guard let url = URL(string: "https://connpass.com/api/v1/event/?keyword=\(keyword)"
        ) else {
            print("urlError::::")
            self.isSearchAlert = true
            return

        }
        print(url)
        let request = URLRequest(url: url)


        URLSession.shared.dataTask(with: request) { data, responce, error in
            if let data = data {
                //Json -> Swift
                let decoder = JSONDecoder()
                guard let decodedEvents = try? decoder.decode(Response.self, from: data) else {
                    print("Json decode エラー")
                    return
                }

                DispatchQueue.main.async {
                    self.events = decodedEvents.events
                }
            } else {
                debugPrint(error ?? "Unknown error")
            }
        }.resume()
    }

}
