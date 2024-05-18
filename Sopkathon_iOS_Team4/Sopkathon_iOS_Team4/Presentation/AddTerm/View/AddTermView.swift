//
//  AddTermView.swift
//  Sopkathon_iOS_Team4
//
//  Created by 왕정빈 on 5/19/24.
//

import UIKit

import Then
import SnapKit

final class AddTermView: UIView {
    
    // MARK: - UI Properties
    
    private let termLabel = UILabel()

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
        termLabel.do {
            $0.text = "단어"
            $0.font = .pretendardSemiBold(size: 16)
            $0.textColor = .white0
        }
    }
    
    private func setHierarchy() {
       addSubviews(termLabel)
    }
    
    private func setLayout() {
        termLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(87)
            $0.leading.equalToSuperview().offset(24)
            $0.width.equalTo(28)
        }
    }
}
