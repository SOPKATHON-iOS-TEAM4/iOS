//
//  TermHistoryCollectionViewCell.swift
//  Sopkathon_iOS_Team4
//
//  Created by 오연서 on 5/19/24.
//

import UIKit

import SnapKit
import Then

final class TermHistoryCollectionViewCell: UICollectionViewCell {
    
    //MARK: - UIViews
    
    private let categoryBackgroundView = UIView().then {
        $0.backgroundColor = .main80
        $0.layer.cornerRadius = 4
        $0.layer.masksToBounds = true
    }
    private let categoryLabel = UILabel().then {
        $0.text = "간식"
        $0.font = .pretendardSemiBold(size: 12)
        $0.textColor = .main50
    }
    
    private let termLabel = UILabel().then {
        $0.text = "termBlur"
        $0.font = .pretendardSemiBold(size: 20)
        $0.textColor = .white
    }
    
    private let meaningLabel = UILabel().then {
        $0.text = "최고~"
        $0.font = .pretendardMedium(size: 13)
        $0.textColor = .grayscale30
    }
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierachy()
        setupLayout()
        setupStyle()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupHierachy() {
        addSubviews(categoryBackgroundView,categoryLabel, termLabel, meaningLabel)
    }
    
    private func setupLayout() {
        
        categoryBackgroundView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(11)
            $0.leading.equalToSuperview().inset(12)
            $0.height.equalTo(22)
            $0.width.equalTo(categoryLabel.sizeThatFits(CGSize(width: CGFloat.greatestFiniteMagnitude,
                                                               height: categoryLabel.frame.size.height)).width + 10)
        }
        
        categoryLabel.snp.makeConstraints{
            $0.centerX.centerY.equalTo(categoryBackgroundView)
        }
        
        termLabel.snp.makeConstraints{
            $0.top.equalTo(categoryLabel.snp.bottom).offset(17)
            $0.leading.equalToSuperview().inset(14)
        }
        
        meaningLabel.snp.makeConstraints{
            $0.top.equalTo(termLabel).offset(5)
            $0.leading.equalTo(termLabel.snp.trailing).offset(12)
        }
    }
    
    private func setupStyle() {
        self.backgroundColor = .grayscale80
        self.layer.cornerRadius = 10
    }
}
