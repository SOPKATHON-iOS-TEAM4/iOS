//
//  GetMomorizedWordsDTO.swift
//  Sopkathon_iOS_Team4
//
//  Created by 박민서 on 5/19/24.
//

import Foundation


struct Response_GetMomorizedWordsDTO: Codable {
    let code: Int
    let success: Bool
    let message: String
    let memorizedWordList: [MemorizedWordList]

    enum CodingKeys: String, CodingKey {
        case code, success, message
        case memorizedWordList = "memorized_word_list"
    }
}

struct MemorizedWordList: Codable {
    let memorizedWordID, categoryID: Int
    let memorizedVocabulary, memorizedMeaning: String

    enum CodingKeys: String, CodingKey {
        case memorizedWordID = "memorized_word_id"
        case categoryID = "category_id"
        case memorizedVocabulary = "memorized_vocabulary"
        case memorizedMeaning = "memorized_meaning"
    }
}
