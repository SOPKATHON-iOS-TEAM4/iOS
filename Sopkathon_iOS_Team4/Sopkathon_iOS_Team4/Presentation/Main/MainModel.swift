//
//  MainModel.swift
//  Sopkathon_iOS_Team4
//
//  Created by Gahyun Kim on 2024/05/19.
//

import Foundation
struct MainModel {
    let title: String
    let count: Int
}

extension MainModel {
    static func dummy() -> [MainModel] {
        return [
            MainModel(title: "test", count: 1),
            MainModel(title: "테스틀라고~", count: 2),
            MainModel(title: "하아아아아암", count: 12),
            MainModel(title: "하아아아아암", count: 12)
        ]
    }
}

