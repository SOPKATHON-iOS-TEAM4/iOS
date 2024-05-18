//
//  HomeAPIService.swift
//  Sopkathon_iOS_Team4
//
//  Created by Gahyun Kim on 2024/05/16.
//

import Foundation
import Moya

enum HomeAPIService {
    /// 카테고리 리스트 조회
    case getCategoryList
    /// 카테고리 추가
    case postCategory(categoryName: String)
    /// 단어 리스트 조회
    case getTermList(categoryId: Int)
    /// 새로운 단어 추가
    case postNewTerm(categoryId: Int, vocabulary: String, meaning: String)
    /// 외운 단어 리스트 조회
    case getMemorizedWords
    /// 특정 단어 클릭 시 조회
    case getTermInfo(categoryId: Int, wordId: Int)
}

extension HomeAPIService: TargetType {
    
    var baseURL: URL {
        return URL(string: BASE_URL)!
    }
    
    var path: String {
        switch self {
            
        
        
        case .getCategoryList:
            return "/api/v1/categories"
        case .postCategory(categoryName: let categoryName):
            return "/api/v1/categories/input"
        case .getTermList(categoryId: let categoryId):
            return "/api/v1/categories/\(categoryId)/words"
        case .postNewTerm(
            categoryId: let categoryId,
            vocabulary: let vocabulary,
            meaning: let meaning
        ):
            return "/api/v1/categories/\(categoryId)/words/input"
        case .getMemorizedWords:
            return "/api/v1/memorized-words"
        case .getTermInfo(categoryId: let categoryId, wordId: let wordId):
            return "/api/v1/categories/\(categoryId)/words/\(wordId)"
        }
    }
    
    var method: Moya.Method {
        switch self {
            
        case .getCategoryList, .getTermList, .getMemorizedWords, .getTermInfo:
            return .get
        case .postCategory, .postNewTerm:
            return .post
        }
    }
    
    var task: Moya.Task {
        switch self {
            
        case .getCategoryList:
            return .requestPlain
        case .postCategory(categoryName: let categoryName):
            return .requestJSONEncodable(PostCategoryDTO.init(category_name: categoryName))
        case .getTermList(categoryId: let categoryId):
            return .requestPlain
        case .postNewTerm(categoryId: let categoryId, vocabulary: let vocabulary, meaning: let meaning):
            return .requestJSONEncodable(PostNewTermDTO(vocabulary: vocabulary, meaning: meaning))
        case .getMemorizedWords:
            return .requestPlain
        case .getTermInfo(categoryId: let categoryId, wordId: let wordId):
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type":"application/json"]
    }
}
