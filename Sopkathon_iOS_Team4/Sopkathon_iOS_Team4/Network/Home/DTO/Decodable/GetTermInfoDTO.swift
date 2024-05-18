//
//  GetTermInfoDTO.swift
//  Sopkathon_iOS_Team4
//
//  Created by 박민서 on 5/19/24.
//


import Foundation

struct Response_GetTermInfoDTO: Codable {
    let code: Int
    let success: Bool
    let message: String
    let word: Word
}

struct Word: Codable {
    let wordID, categoryID: Int
    let vocabulary, meaning: String
    let clickCount: Int

    enum CodingKeys: String, CodingKey {
        case wordID = "word_id"
        case categoryID = "category_id"
        case vocabulary, meaning
        case clickCount = "click_count"
    }
}
