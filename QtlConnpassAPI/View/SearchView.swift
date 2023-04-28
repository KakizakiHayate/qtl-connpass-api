//
//  ContentView.swift
//  ConnpassShowList
//
//  Created by 柿崎逸 on 2023/03/25.
//

import SwiftUI

struct SearchView: View {
    
    // MARK: - Property Wrappers
    @State private var keyword = ""
    // MARK: - Property Wrappers
    // ListViewを表示
    @State private var isListView = false
    // MARK: - Property Wrappers
    // Alert表示
    @State private var isSearchAlert = false
    
    // MARK: - body
    var body: some View {
        NavigationStack {
            VStack {
                TextField("キーワード入力", text: $keyword)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.bottom)
                
                Button {
                    if !keyword.isEmpty {
                        self.isListView = true
                    } else {
                        self.isSearchAlert = true
                    }
                } label: {
                    Text("検索")
                }
                .navigationDestination(isPresented: $isListView) {
                    ListView(keyword: $keyword)
                }
                .alert("お知らせ", isPresented: $isSearchAlert) {
                    Text("OK")
                } message: {
                    Text("キーワードが入力されていません。")
                }
            }
            .padding()
        }
    }// body
}// view

// MARK: - Preview
// 以下にpreviewのソースが入ります
struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
