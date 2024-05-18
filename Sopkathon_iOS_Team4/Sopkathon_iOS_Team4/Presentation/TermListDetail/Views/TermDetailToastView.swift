//
//  TermDetailToastView.swift
//  Sopkathon_iOS_Team4
//
//  Created by 박민서 on 5/19/24.
//

import UIKit

import SnapKit
import Then

final class TermDetailToastView: UIView {
    
    // MARK: - Properties
    private var content: TermModel?
    
    // MARK: - UI Components
    
    private let engTextLabel = UILabel()
    private let korTextLabel = UILabel()
    private let reduceButton = UIButton()
    private let countLabel = UILabel()
    
    private lazy var textStack = UIStackView(arrangedSubviews: [engTextLabel, korTextLabel])
    private lazy var btnStack = UIStackView(arrangedSubviews: [reduceButton, countLabel])
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        self.makeRounded(radius: 14)
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension TermDetailToastView {
    func configure(model: TermModel) {
        self.engTextLabel.text = model.termContentEng
        self.korTextLabel.text = model.termContentKor
        self.countLabel.text = "\(model.termCount)/7"
    }
}

// MARK: - Extensions

private extension TermDetailToastView {
    func setupStyle() {
        engTextLabel.do {
            $0.font = .pretendardMedium(size: 16)
            $0.textColor = .black
        }
        
        korTextLabel.do {
            $0.font = .pretendardMedium(size: 14)
            $0.textColor = .grayscale40
        }
        
        reduceButton.do {
            $0.setImage(UIImage(named: "ic_reduce"), for: .normal)
        }
        
        countLabel.do {
            let attrStr = NSAttributedString(
                            string: "n/n",
                            attributes: [
                                .font : UIFont.pretendardMedium(size: 14),
                                .foregroundColor : UIColor.main40,
                            ])
            $0.attributedText = attrStr
        }
        
        textStack.do {
            $0.axis = .vertical
            $0.spacing = 5
        }
        
        btnStack.do {
            $0.axis = .vertical
            $0.spacing = 5
            $0.alignment = .center
        }
    }
    
    func setupHierarchy() {
        [
            textStack,
            btnStack
        ].forEach { self.addSubviews($0) }
    }
    
    func setupLayout() {
        textStack.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(24)
            $0.centerY.equalToSuperview()
        }
        
        reduceButton.snp.makeConstraints {
            $0.size.equalTo(30)
        }
        
        btnStack.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-16)
            $0.centerY.equalToSuperview()
        }
    }
}
