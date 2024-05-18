//
//  MainModel.swift
//  Sopkathon_iOS_Team4
//
//  Created by Gahyun Kim on 2024/05/19.
//

import Foundation
struct MainModel {
    let categoryId: Int
    let categoryName: String
    let wordsNumber: Int
}

extension MainModel {
    static func dummy() -> [MainModel] {
        return [
            MainModel(categoryId: 0, categoryName: "test", wordsNumber: 1),
            MainModel(categoryId: 1, categoryName: "test", wordsNumber: 2),
            MainModel(categoryId: 2, categoryName: "test", wordsNumber: 3),
            MainModel(categoryId: 3, categoryName: "test", wordsNumber: 5),
            MainModel(categoryId: 4, categoryName: "test", wordsNumber: 6),
        ]
    }
}

