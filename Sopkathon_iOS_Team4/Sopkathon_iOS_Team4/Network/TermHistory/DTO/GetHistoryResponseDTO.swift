//
//  GetHistoryResponseDTO.swift
//  Sopkathon_iOS_Team4
//
//  Created by 오연서 on 5/19/24.
//

import Foundation

struct GetHistoryResponseDTO: Codable {
    let code: Int
    let success: Bool
    let message: String
    let memorizedWordList: [MemorizedWord]

    private enum CodingKeys: String, CodingKey {
        case code, success, message
        case memorizedWordList = "memorized_word_list"
    }
}

struct MemorizedWord: Codable {
    let memorizedWord: WordObject

    private enum CodingKeys: String, CodingKey {
        case memorizedWord = "memorized_word"
    }
}

struct WordObject: Codable {
    let name: String
    let type: String
    let description: String
}
