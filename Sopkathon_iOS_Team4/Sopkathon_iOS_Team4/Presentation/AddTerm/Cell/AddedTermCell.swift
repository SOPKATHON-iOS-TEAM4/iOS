//
//  AddedTermCell.swift
//  Sopkathon_iOS_Team4
//
//  Created by 왕정빈 on 5/19/24.
//

import UIKit

class AddedTermCell: UICollectionViewCell {
    
    // MARK: - UI Properties
    
    private let addedTermLabel = UILabel()
    
    private lazy var deleteButton = UIButton()
    
    // MARK: - Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setHierarchy()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setting
    
    private func setUI() {
        backgroundColor = .main20
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.main70.cgColor
        layer.cornerRadius = 18
        
        addedTermLabel.do {
            $0.font = .pretendardMedium(size: 14)
            $0.textColor = .main70
        }
        
        deleteButton.do {
            $0.setImage(UIImage(systemName: "xmark"), for: .normal)
            $0.tintColor = .main50
        }
    }
    
    private func setHierarchy() {
        contentView.addSubviews(addedTermLabel, deleteButton)
    }
    
    private func setLayout() {
        addedTermLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(10)
        }
        
        deleteButton.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(addedTermLabel.snp.trailing).offset(4)
            $0.trailing.equalToSuperview().offset(-7)
            $0.size.equalTo(16)
        }
    }
}

// MARK: - Data Bind

extension AddedTermCell {
    func dataBind(_ data: AddedTerm) {
        let addedTerm = "\(data.term)/\(data.termMeaning)"
        addedTermLabel.text = addedTerm
    }
}
