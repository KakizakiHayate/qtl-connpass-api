//
//  APIResultTextView.swift
//  QtlConnpassAPI
//
//  Created by 柿崎逸 on 2023/05/23.
//

import SwiftUI

struct APIResultListTextView: View {
    // MARK: - Property Wrappers
    @Environment(\.openURL) private var openURL
    
    // MARK: - Properties
    private let item: Events
    
    // MARK: - Initialize
    init(item: Events) {
        self.item = item
    }
    
    // MARK: - body
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
    } // body
} // view


