//
//  APIService.swift
//  Sopkathon_iOS_Team4
//
//  Created by 박민서 on 5/19/24.
//

import Foundation
import Moya

let BASE_URL = "http://3.34.16.87/api/v1"

final class APIService<Provider : TargetType> : MoyaProvider<Provider> {

    func sendRequest<Model : Decodable>(target : Provider,
                                            instance : Model.Type,
                                            completion : @escaping(Result<Model, MoyaError>) -> () ){
        self.request(target) { result in
            switch result {
            case .success(let response):
                do {
                    let stringData = String(data: response.data, encoding: .utf8) ?? "" // Data를 String으로 변환 - 디버깅
                    print("-----\(stringData)------")
                    try self.validateStatusCode(with: response) // 일종의 Guard라고 생각했습니다..!
                    let decodedData = try JSONDecoder().decode(Model.self, from: response.data)
                    completion(.success(decodedData))
                } catch let error as MoyaError{
                    completion(.failure(error)) // status validating에서 발생한 에러가 빠집니다
                } catch {
                    completion(.failure(.underlying(error, response))) // 디코딩 에러는 여기로 빠집니다
                }
                
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    private func validateStatusCode(with response: Response) throws {
        switch response.statusCode {
        case 200..<300:
            return
        case 400...500:
            throw MoyaError.statusCode(response)
        default:
            throw MoyaError.underlying(URLError(.networkConnectionLost), response)
        }
    }
}
