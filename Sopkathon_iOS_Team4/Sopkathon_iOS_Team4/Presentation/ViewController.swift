//
//  ViewController.swift
//  Sopkathon_iOS_Team4
//
//  Created by Gahyun Kim on 2024/05/16.
//

import UIKit

class ViewController: UIViewController {
    
    let testService = APIService<HomeAPIService>()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func getCategoryList() {
        testService.sendRequest(
            target: .getCategoryList,
            instance: Response_GetCategoryListDTO.self,
            completion: { result in
                switch result {
                    
                case .success(let result):
                    print(result.result)
                case .failure(let error):
                    print(error)
                }
            }
        )
    }
    
    func postCategory(categoryName: String) {
        testService.sendRequest(
            target: .postCategory(categoryName: categoryName),
            instance: Response_PostCategoryDTO.self,
            completion: { result in
                print("@TAG - \(result)")
                switch result {
                    
                case .success(let result):
                    print(result.success)
                case .failure(let error):
                    print(error)
                }
            }
        )
    }
    
    func getTermList(categoryId: Int) {
        testService.sendRequest(
            target: .getTermList(categoryId: categoryId),
            instance: Response_GetTermListDTO.self,
            completion: { result in
                switch result {
                    
                case .success(let result):
                    print(result.result)
                case .failure(let error):
                    print(error)
                }
            }
        )
    }
    
    func postNewTerm(
        categoryId: Int,
        vocabulary: String,
        meaning: String
    ) {
        testService.sendRequest(
            target: .postNewTerm(categoryId: categoryId, vocabulary: vocabulary, meaning: meaning),
            instance: Response_PostNewTermDTO.self,
            completion: { result in
                switch result {
                    
                case .success(let result):
                    print(result.success)
                case .failure(let error):
                    print(error)
                }
            }
        )
    }
    
    func getMemorizedWords() {
        testService.sendRequest(
            target: .getMemorizedWords,
            instance: Response_GetMomorizedWordsDTO.self,
            completion: { result in
                switch result {
                    
                case .success(let result):
                    print(result.memorizedWordList)
                case .failure(let error):
                    print(error)
                    
                }
            }
        )
    }
    
    func getTermInfo(categoryId: Int, wordId: Int) {
        testService.sendRequest(
            target: .getTermInfo(categoryId: categoryId, wordId: wordId),
            instance: Response_GetTermInfoDTO.self,
            completion: { result in
                switch result {
                    
                case .success(let result):
                    print(result.word)
                case .failure(let error):
                    print(error)
                    
                }
            }
        )
    }


}

//case getCategoryList
///// 카테고리 추가
//case postCategory(categoryName: String)
///// 단어 리스트 조회
//case getTermList(categoryId: Int)
///// 새로운 단어 추가
//case postNewTerm(categoryId: Int, vocabulary: String, meaning: String)
///// 외운 단어 리스트 조회
//case getMemorizedWords
///// 특정 단어 클릭 시 조회
//case getTermInfo(categoryId: Int, wordId: Int)
