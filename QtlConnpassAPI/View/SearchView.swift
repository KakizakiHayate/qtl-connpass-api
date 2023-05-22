//
//  ContentView.swift
//  ConnpassShowList
//
//  Created by 柿崎逸 on 2023/03/25.
//

import SwiftUI
import CoreData

struct SearchView: View {
    // MARK: - Property Wrappers
    @State var keyword = ""
    @State private var isListView = false
    @State private var isSearchAlert = false
    @State private var isLogSearchAlert = false
    @StateObject var searchViewModel = SearchViewModel()
    @FetchRequest(sortDescriptors: []) var logs: FetchedResults<Log>
    @Environment(\.managedObjectContext) var moc
    
    // MARK: - body
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    TextField(AppConst.Text.inputKeyword, text: $keyword)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.bottom)
                    Button {
                        // TextFieldのキーワード未入力チェック
                        if !keyword.isEmpty {
                            self.isListView.toggle()
                        } else {
                            // TextFieldが空だったらAlertで知らせる
                            self.isSearchAlert.toggle()
                        }
                        //  データ保存
                        searchViewModel.saveData(managedObjectContext: moc, keyword: keyword)
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .padding(10)
                            .background(.blue)
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }.padding(.bottom)
                }
                .navigationDestination(isPresented: $isListView) {
                    APIResultView(keyword: $keyword)
                }
                .alert(AppConst.Text.notice, isPresented: $isSearchAlert) {
                    Text(AppConst.Text.ok)
                } message: {
                    Text(AppConst.Text.inputEmptyKeyword)
                }
                
                ZStack {
                    List {
                        ForEach(logs) { log in
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
                        }
                    }
                    VStack {
                        Spacer()
                        HStack {
                            Spacer(minLength: 60.0)
                            Button {
                                searchViewModel.deleteData(managedObjectContext: moc, logs: logs)
                            } label: {
                                Image(systemName: "trash")
                                    .padding()
                                    .frame(width: 90, height: 90)
                                    .background(.blue)
                                    .foregroundColor(.white)
                                    .cornerRadius(50)
                                    .font(.system(size: 30))
                            }
                        }
                    }
                }
            }
            .padding()
            .onAppear {
                self.keyword = AppConst.Text.empty
            }
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
