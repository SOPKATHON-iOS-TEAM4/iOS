//
//  Configuration.swift
//  Sopkathon_iOS_Team4
//
//  Created by 오연서 on 5/19/24.
//

import Foundation

enum Configuration {

    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
        }
    }

    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist cannot found")
        }
        return dict
    }()
}

extension Configuration {
    static let baseURL: String = {
        guard let key = Configuration.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Base URL is not set in plist for this configuration")
        }
        return key
    }()
}
