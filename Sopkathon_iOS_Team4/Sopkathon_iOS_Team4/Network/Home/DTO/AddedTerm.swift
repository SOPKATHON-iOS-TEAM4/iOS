//
//  AddedTerm.swift
//  Sopkathon_iOS_Team4
//
//  Created by 왕정빈 on 5/19/24.
//

import Foundation

struct AddedTerm: Hashable {
    let term: String
    let termMeaning: String
}

extension AddedTerm {
    static let list = [
    AddedTerm(term: "apple", termMeaning: "사과"),
    AddedTerm(term: "hello", termMeaning: "안녕"),
    AddedTerm(term: "ayouready", termMeaning: "아임레디")
    ]
}
