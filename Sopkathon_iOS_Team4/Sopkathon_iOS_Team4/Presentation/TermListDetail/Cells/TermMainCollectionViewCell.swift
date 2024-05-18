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
    let termContentEng: String
    let termContentKor: String
    let termCount: Int
}

final class TermMainCollectionlViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private var cellModel: TermModel?
    
    // MARK: - UI Components
    
    private var backView = UIView()
    private var termLabel = UILabel()
    
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
        backView.do {
            $0.backgroundColor = .blue
        }
        
        termLabel.do {
            $0.font = .pretendardMedium(size: 16)
            $0.textColor = .white
            $0.numberOfLines = 2
        }
    }
    
    func setupHierarchy() {
        [backView, termLabel].forEach { self.contentView.addSubview($0) }
    }
    
    func setupLayout() {
        backView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        termLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(5)
            $0.trailing.bottom.equalToSuperview().offset(-5)
        }
    }
}
