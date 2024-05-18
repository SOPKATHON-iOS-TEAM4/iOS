//
//  TermMainCollectionlViewCell.swift
//  Sopkathon_iOS_Team4
//
//  Created by 박민서 on 5/19/24.
//

import UIKit

import SnapKit
import Then

struct TermModel {
    let termId: Int
    let termContent: String
}

final class TermMainCollectionlViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    
    // MARK: - UI Components
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension TermMainCollectionlViewCell {
    func setupStyle() {
        
    }
    
    func setupHierarchy() {

    }
    
    func setupLayout() {

    }
}
