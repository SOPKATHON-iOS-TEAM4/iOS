//
//  GetMomorizedWordsDTO.swift
//  Sopkathon_iOS_Team4
//
//  Created by 박민서 on 5/19/24.
//

import Foundation

// MARK: - Welcome
struct Response_GetMomorizedWordsDTO: Codable {
    let code: Int
    let success: Bool
    let message: String
    let result: [WordList]
}

// MARK: - Result
struct WordList: Codable {
    let memorizedWordID, categoryID: Int
    let memorizedVocabulary, memorizedMeaning: String

    enum CodingKeys: String, CodingKey {
        case memorizedWordID = "memorizedWordId"
        case categoryID = "categoryId"
        case memorizedVocabulary, memorizedMeaning
    }
}



    


