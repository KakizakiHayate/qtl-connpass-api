//
//  ListView.swift
//  ConnpassShowList
//
//  Created by 柿崎逸 on 2023/03/26.
//

import SwiftUI

struct APIResultView: View {
    
    // MARK: - Property Wrappers
    @StateObject private var apiResultViewModel = APIResultViewModel()
    // MARK: - Property Wrappers
    @Binding var keyword: String
    // MARK: - Property Wrappers
    @Environment(\.openURL) private var openURL
    // MARK: - Property Wrappers
    // 画面を閉じる
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - body
    var body: some View {
        List(apiResultViewModel.events) { item in
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
        }.onAppear {
            // 通信する
            apiResultViewModel.loadEventData(keyword: keyword)
        }
        .alert(AppConst.Text.notice, isPresented: $apiResultViewModel.isSearchAlert) {
            Button {
                //画面を閉じる
                dismiss()
            } label: {
                Text(AppConst.Text.ok)
            }
        } message: {
            Text(AppConst.Text.notFoundKeyword)
        }
        
    }// body
}// view

// MARK: - Preview
//以下にpreviewのソースが入ります
struct APIResultView_Previews: PreviewProvider {
    static var previews: some View {
        APIResultView(keyword: .constant(""))
    }
}
