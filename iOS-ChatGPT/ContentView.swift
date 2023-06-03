//
//  ContentView.swift
//  iOS-ChatGPT
//
//  Created by Mohammad Azam on 3/15/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented:Bool = false
    
    var body: some View {
       
        NavigationStack {
            MainView()
                .sheet(isPresented:$isPresented,content:  {
                    NavigationStack {
                        HistoryView(showHistoryView: $isPresented).navigationTitle("History")
                    }
                })
                .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button{
                            isPresented = true
                        } label:{
                            Text("Show History")
                        }
                       
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
            .environment(\.managedObjectContext,CoreDataManager.shared.persistentContainer.viewContext)
            .environmentObject(Model())
        
    }
}
