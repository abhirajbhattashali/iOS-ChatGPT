//
//  MainView.swift
//  ChatGPTApp
//
//  Created by Mohammad Azam on 3/15/23.
//

import SwiftUI
import OpenAISwift

struct MainView: View {
    
    @State private var chatText: String = ""
    let openAI = OpenAISwift(authToken: "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")
    
    
    
    @EnvironmentObject private var model:Model
    
    private var isFormValid: Bool {
        !chatText.isEmptyOrWhiteSpace
    }
    
    private func performSearch() {
        openAI.sendCompletion(with: chatText, maxTokens: 500) { result in
            switch result {
                case .success(let success):
               
                    let answer = success.choices.first?.text.trimmingCharacters(in: .whitespacesAndNewlines) ?? ""
                    
                    let query = Query(question: chatText, answer: answer)
                DispatchQueue.main.async {
                    model.queries.append(query)
                    do {
                        try model.saveQuery(query)
                    }catch{
                        print(error.localizedDescription)
                    }
                    chatText = ""
                }
                    
                    
                case .failure(let failure):
                    print(failure)
            }
        }
    }
    
    var body: some View {
        VStack {
            
            ScrollView {
                ScrollViewReader{proxy in
                    ForEach(model.queries, id: \.self) { query in
                        VStack(alignment:.leading){
                            Text(query.question)
                                .fontWeight(.bold)
                            Text(query.answer)
                        }.frame(maxWidth:.infinity,alignment: .leading)
                            .padding([.bottom],10)
                            .id(query.id)
                            .listRowSeparator(.hidden)
                    }.listStyle(.plain)
                        .onChange(of: model.queries) { query in
                            if !model.queries.isEmpty{
                                let lastQuery = model.queries[model.queries.endIndex-1]
                                withAnimation {
                                    proxy.scrollTo(lastQuery)
                                }
                            }
                        }
                }
            }.padding()
            
            Spacer()
            HStack {
                TextField("Search...", text: $chatText)
                    .textFieldStyle(.roundedBorder)
                Button {
                    // action
                    performSearch()
                } label: {
                    Image(systemName: "paperplane.circle.fill")
                        .font(.title)
                        .rotationEffect(Angle(degrees: 45))
                }.buttonStyle(.borderless)
                    .tint(.blue)
                    .disabled(!isFormValid)

            }
        }.padding()
            .onChange(of:model.query) { query in
                    model.queries.append(query)
            }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(Model())
           
            
    }
}
