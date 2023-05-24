//
//  APIResultTextView.swift
//  QtlConnpassAPI
//
//  Created by 柿崎逸 on 2023/05/23.
//

import SwiftUI

struct APIResultListTextView: View {
    private let item: Events
    @Environment(\.openURL) private var openURL
    
    init(item: Events) {
        self.item = item
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(AppConst.Text.title + item.title)
            Text(item.catchCopy)
            Text(AppConst.Text.showMore)
                .foregroundColor(.blue)
                .onTapGesture {
                    if let url = URL(string: item.eventURL) {
                        openURL(url)
                    }
                }
        }
    }
}


