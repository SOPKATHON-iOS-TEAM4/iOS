//
//  NSObject+.swift
//  Sopkathon_iOS_Team4
//
//  Created by Gahyun Kim on 2024/05/16.
//

import Foundation

extension NSObject {
    static var className: String {
        return String(describing: self)
    }
}
