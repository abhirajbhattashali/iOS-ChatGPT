//
//  String+Extensions.swift
//  ChatGPTApp
//
//  Created by Mohammad Azam on 3/14/23.
//

import Foundation

extension String {
    
    var isEmptyOrWhiteSpace: Bool {
        self.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
}
