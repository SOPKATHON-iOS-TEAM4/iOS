//
//  GetCategoryListDTO.swift
//  Sopkathon_iOS_Team4
//
//  Created by 박민서 on 5/19/24.
//

import Foundation


struct Response_GetCategoryListDTO: Codable {
    let code: Int
    let success: Bool
    let message: String
    let result: [Result1]
}

// MARK: - Result
struct Result1: Codable {
    let categoryID: Int
    let categoryName: String
    let wordsNumber: Int

    enum CodingKeys: String, CodingKey {
        case categoryID = "categoryId"
        case categoryName, wordsNumber
    }
}
