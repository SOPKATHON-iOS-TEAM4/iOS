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
                            string: "추가하기",
                            attributes: [
                                .font : UIFont.pretendardSemiBold(size: 14),
                                .foregroundColor : UIColor.white0
                            ])
            $0.setAttributedTitle(attrStr, for: .normal)
            $0.setBackgroundColor(.main60, for: .normal)
            $0.layer.cornerRadius = 10
        }
    }
    
    private func setHierarchy() {
       addSubviews(termLabel, termTextField, addTermButton)
    }
    
    private func setLayout() {
        termLabel.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide).offset(87)
            $0.leading.equalToSuperview().offset(24)
            $0.width.equalTo(28)
        }
        
        termTextField.snp.makeConstraints {
            $0.top.equalTo(termLabel.snp.bottom).offset(33)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(46)
        }
        
        addTermButton.snp.makeConstraints {
            $0.trailing.equalTo(termTextField).offset(-6)
            $0.centerY.equalTo(termTextField)
            $0.width.equalTo(70)
            $0.height.equalTo(34)
        }
    }
}
