//
//  GetTermListDTO.swift
//  Sopkathon_iOS_Team4
//
//  Created by 박민서 on 5/19/24.
//

import Foundation

struct Response_GetTermListDTO: Codable {
    let code: Int
    let success: Bool
    let message: String
    let result: [Result2]
}

// MARK: - Result
struct Result2: Codable {
    let wordID, categoryID: Int
    let vocabulary, meaning: String
    let clickCount: Int

    enum CodingKeys: String, CodingKey {
        case wordID = "wordId"
        case categoryID = "categoryId"
        case vocabulary, meaning, clickCount
    }
}
