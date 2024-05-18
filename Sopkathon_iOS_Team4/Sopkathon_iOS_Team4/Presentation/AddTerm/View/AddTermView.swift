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
    
    private let termTextField = UITextField()
    
    private lazy var addTermButton = UIButton()
    
    private let termMeaningLabel = UILabel()
    
    private let termMeaningTextField = UITextField()
    
    private lazy var addTermMeaningButton = UIButton()

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
        
        termTextField.do {
            $0.backgroundColor = .grayscale70
            $0.addPadding(left: 16, right: 16)
            $0.changePlaceholderColor(forPlaceHolder: "단어를 입력해주세요", forColor: .grayscale50)
            $0.makeRounded(radius: 15)
        }
        
        addTermButton.do {
            let attrStr = NSAttributedString(
                            string: "추가",
                            attributes: [
                                .font : UIFont.pretendardSemiBold(size: 14),
                                .foregroundColor : UIColor.grayscale30
                            ])
            $0.setAttributedTitle(attrStr, for: .normal)
            $0.setBackgroundColor(.grayscale50, for: .normal)
            $0.layer.cornerRadius = 10
        }
        
        termMeaningLabel.do {
            $0.text = "뜻"
            $0.font = .pretendardSemiBold(size: 16)
            $0.textColor = .white0
        }
        
        termMeaningTextField.do {
            $0.backgroundColor = .grayscale70
            $0.addPadding(left: 16, right: 16)
            $0.changePlaceholderColor(forPlaceHolder: "단어의 뜻을 입력해주세요", forColor: .grayscale50)
            $0.makeRounded(radius: 15)
        }
        
        addTermMeaningButton.do {
            let attrStr = NSAttributedString(
                            string: "추가",
                            attributes: [
                                .font : UIFont.pretendardSemiBold(size: 14),
                                .foregroundColor : UIColor.grayscale30
                            ])
            $0.setAttributedTitle(attrStr, for: .normal)
            $0.setBackgroundColor(.grayscale50, for: .normal)
            $0.layer.cornerRadius = 10
        }
    }
    
    private func setHierarchy() {
        [
            termLabel, termTextField, addTermButton, termMeaningLabel, termMeaningTextField, addTermMeaningButton
        ].forEach { self.addSubviews($0) }
    }
    
    private func setLayout() {
        termLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(87)
            $0.horizontalEdges.equalToSuperview().offset(24)
        }
        
        termTextField.snp.makeConstraints {
            $0.top.equalTo(termLabel.snp.bottom).offset(33)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(46)
        }
        
        addTermButton.snp.makeConstraints {
            $0.trailing.equalTo(termTextField).offset(-6)
            $0.centerY.equalTo(termTextField)
            $0.width.equalTo(50)
            $0.height.equalTo(34)
        }
        
        termMeaningLabel.snp.makeConstraints {
            $0.top.equalTo(termTextField.snp.bottom).offset(32)
            $0.horizontalEdges.equalToSuperview().offset(24)
        }
        
        termMeaningTextField.snp.makeConstraints {
            $0.top.equalTo(termMeaningLabel.snp.bottom).offset(18)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(46)
        }
        
        addTermMeaningButton.snp.makeConstraints {
            $0.trailing.equalTo(termMeaningTextField).offset(-6)
            $0.centerY.equalTo(termMeaningTextField)
            $0.width.equalTo(50)
            $0.height.equalTo(34)
        }
    }
}
