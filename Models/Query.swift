//
//  Query.swift
//  ChatGPTApp
//
//  Created by Abhiraj on 03/05/23.
//

import Foundation

struct Query:Identifiable,Hashable{
    let id = UUID()
    let question:String
    let answer:String
    
}
