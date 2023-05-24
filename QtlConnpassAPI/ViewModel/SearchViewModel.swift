//
//  SearchViewModel.swift
//  QtlConnpassAPI
//
//  Created by 柿崎逸 on 2023/05/20.
//

import Foundation
import CoreData
import SwiftUI

class SearchViewModel: ObservableObject {
    /// CoreDataのデータ保存
    func saveData(managedObjectContext: NSManagedObjectContext, keyword: String) {
        let newItem = Log(context: managedObjectContext)
        newItem.keyword = keyword

        do {
            try managedObjectContext.save()
        } catch {
            print("データの保存に失敗しました: \(error.localizedDescription)")
        }
    }
    
    /// CoreDataのデータ削除
    func deleteData(managedObjectContext: NSManagedObjectContext, logs: FetchedResults<Log>) {
        for log in logs {
            if log.checked {
                managedObjectContext.delete(log)
            }
        }
        
        do {
            try managedObjectContext.save()
        } catch {
            print("データの保存に失敗しました: \(error.localizedDescription)")
        }
    }
}
