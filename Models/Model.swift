//
//  Model.swift
//  ChatGPTApp
//
//  Created by Abhiraj on 08/05/23.
//

import Foundation

class Model:ObservableObject{
    @Published var queries:[Query] = []
    @Published var query = Query(question: " ", answer: " ")
    
    func saveQuery(_ query:Query) throws {
        let viewContext = CoreDataManager.shared.persistentContainer.viewContext
        let historyItem = HistoryItem(context: viewContext)
        historyItem.question = query.question
        historyItem.answer = query.answer
        historyItem.dateCreated = Date()
        try viewContext.save()
    }
}
