//
//  CreateTermListView.swift
//  Sopkathon_iOS_Team4
//
//  Created by 왕정빈 on 5/19/24.
//

import UIKit

import Then
import SnapKit

final class CreateTermListView: UIView {
    
    // MARK: - UI Properties
    
    private let termTitleLabel = UILabel()
    
    private let termListTextField = UITextField()
    
    private let numOfTermListLabel = UILabel()
    
    private let createButton = UIButton()

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
        backgroundColor = .black
        
        termTitleLabel.do {
            $0.text = "단어장 제목"
            $0.font = .pretendardSemiBold(size: 16)
            $0.textColor = .white
        }
        
        termListTextField.do {
            $0.backgroundColor = .grayscale70
            $0.addPadding(left: 16, right: 16)
            $0.changePlaceholderColor(forPlaceHolder: "제목을 입력해주세요", forColor: .grayscale50)
            $0.makeRounded(radius: 15)
        }
        
        numOfTermListLabel.do {
            $0.text = "0/20"
            $0.font = .pretendardMedium(size: 12)
            $0.textColor = .grayscale60
        }
        
        createButton.do {
            $0.setBackgroundColor(.white, for: .normal)
            $0.setTitle("만들기", for: .normal)
            $0.setTitleColor(.grayscale90, for: .normal)
            $0.makeRounded(radius: 10)
        }
    }
    
    private func setHierarchy() {
        addSubviews(termTitleLabel, termListTextField, numOfTermListLabel, createButton)
    }
    
    private func setLayout() {
        termTitleLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(65)
            $0.leading.equalToSuperview().offset(24)
            $0.width.equalTo(73)
        }
        
        termListTextField.snp.makeConstraints {
            $0.top.equalTo(termTitleLabel.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(24)
            $0.height.equalTo(46)
        }
        
        numOfTermListLabel.snp.makeConstraints {
            $0.top.equalTo(termListTextField.snp.bottom).offset(10)
            $0.trailing.equalTo(termListTextField).offset(-6)
        }
        
        createButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-22)
            $0.height.equalTo(56)
        }
    }
}
