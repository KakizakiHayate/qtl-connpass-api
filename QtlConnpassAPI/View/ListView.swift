//
//  ListView.swift
//  ConnpassShowList
//
//  Created by 柿崎逸 on 2023/03/26.
//

import SwiftUI

struct ListView: View {
    
    // MARK: - Property Wrappers
    @StateObject private var listViewModel = ListViewModel()
    // MARK: - Property Wrappers
    @Binding var keyword: String
    // MARK: - Property Wrappers
    @Environment(\.openURL) private var openURL
    // MARK: - Property Wrappers
    // 画面を閉じる
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - body
    var body: some View {
        List(listViewModel.events) { item in
                VStack(alignment: .leading) {
                    Text("タイトル： \(item.title)")
                    Text(item.catchCopy)
                    Text("show more")
                        .foregroundColor(.blue)
                        .onTapGesture {
                        if let url = URL(string: item.eventURL) {
                            openURL(url)
                        }
                                
                    }
                }
            }.onAppear {
                // 通信する
                listViewModel.loadEventData(keyword: keyword)
            }
            .alert("お知らせ", isPresented: $listViewModel.isSearchAlert) {
                Button {
                    //画面を閉じる
                    dismiss()
                } label: {
                    Text("OK")
                }
            } message: {
                Text("入力したキーワードでは\n見つかりませんでした")
            }
        
    }// body
}// view

// MARK: - Preview
//以下にpreviewのソースが入ります
struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(keyword: .constant(""))
    }
}
