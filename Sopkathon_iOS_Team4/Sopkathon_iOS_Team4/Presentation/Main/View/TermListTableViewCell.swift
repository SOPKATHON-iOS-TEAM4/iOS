//
//  TermListTableViewCell.swift
//  Sopkathon_iOS_Team4
//
//  Created by Gahyun Kim on 2024/05/19.
//

import UIKit

import SnapKit
import Then

final class TermListTableViewCell: UITableViewCell {
    
    // MARK: - UI Components
    
    private let titleLabel = UILabel()
    private let countLabel = UILabel()
    private let customImageView = UIImageView()
    
    // MARK: - Life Cycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 24, bottom: 16, right: 24))
        contentView.layer.cornerRadius = 14
    }
    
}


// MARK: - Private Extensions

private extension TermListTableViewCell {
    func setupStyle() {
        self.backgroundColor = .clear
        contentView.backgroundColor = .main30
        
        titleLabel.do {
            $0.font = .pretendardSemiBold(size: 18)
            $0.textColor = .main80
        }
        
        countLabel.do {
            $0.font = .pretendardMedium(size: 14)
            $0.textColor = .main50
        }
        
        customImageView.do {
            $0.image = .imgCustom
        }
    }
    
    func setupHierarchy() {
        contentView.addSubviews(titleLabel, countLabel, customImageView)
    }
    
    func setupLayout() {
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(contentView.snp.top).inset(24)
            $0.leading.equalToSuperview().inset(24)
        }
        
        countLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(12)
            $0.leading.equalTo(titleLabel.snp.leading)
        }
        
        customImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
        }
    }
}

extension TermListTableViewCell {
    func configureCell(forModel: MainModel) {
//        titleLabel.text = forModel.title
//        countLabel.text = String(forModel.count) + "개"
    }
}

