//
//  SearchListTextView.swift
//  QtlConnpassAPI
//
//  Created by 柿崎逸 on 2023/05/23.
//

import SwiftUI

struct SearchListTextView: View {
    // MARK: - Property Wrappers
    @State private var isLogSearchAlert = false
    @Binding var keyword: String
    @Binding var isListView: Bool
    
    // MARK: - Properties
    private var log: FetchedResults<Log>.Element
    
    // MARK: - Initialize
    init(isLogSearchAlert: Bool = false, log: FetchedResults<Log>.Element, keyword: Binding<String>, isListView: Binding<Bool>) {
        self.isLogSearchAlert = isLogSearchAlert
        self.log = log
        self._keyword = keyword
        self._isListView = isListView
    }
    
    // MARK: - body
    var body: some View {
        HStack {
            Image(systemName: log.checked ? "checkmark.circle" : "circle")
                .onTapGesture {
                    log.checked.toggle()
                }
            Text(log.keyword ?? AppConst.Text.empty)
                .onTapGesture {
                    self.isLogSearchAlert.toggle()
                    print("タップ！！！\(log.keyword)")
                    self.keyword = log.keyword ?? AppConst.Text.empty
                }
                .alert(AppConst.Text.confirmation, isPresented: $isLogSearchAlert) {
                    Button {
                        print("\(keyword)")
                        self.isListView.toggle()
                    } label: {
                        Text(AppConst.Text.yes)
                    }
                    Button {
                        self.keyword = ""
                    } label: {
                        Text(AppConst.Text.no)
                    }
                } message: {
                    Text(self.keyword + AppConst.Text.aboveKeywordSearch)
                }
                .navigationDestination(isPresented: $isListView) {
                    APIResultView(keyword: $keyword)
                }
        }
    } // body
} // view

