//
//  FontLiterals.swift
//  Sopkathon_iOS_Team4
//
//  Created by Gahyun Kim on 2024/05/16.
//

import UIKit

enum FontName: String {
    case pretendardBold = "Pretendard-Bold"
    case pretendardSemiBold = "Pretendard-SemiBold"
    case pretendardMedium = "Pretendard-Medium"
}

extension UIFont {
    @nonobjc class func pretendardBold(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.pretendardBold.rawValue, size: size)!
    }
    
    @nonobjc class func pretendardSemiBold(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.pretendardSemiBold.rawValue, size: size)!
    }
    
    @nonobjc class func pretendardMedium(size: CGFloat) -> UIFont {
        return UIFont(name: FontName.pretendardMedium.rawValue, size: size)!
    }
}

