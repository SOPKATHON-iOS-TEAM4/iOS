//
//  BaseResponseDTO.swift
//  Sopkathon_iOS_Team4
//
//  Created by 박민서 on 5/19/24.
//

import Foundation

// MARK: - BaseResponseDTO

struct BaseResponseDTO<T:Decodable>: Decodable {
    let code: Int   // status code
    let success: Bool
    let message: String // description
    let result: T?   // put in Codable Struct to decode
}
