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
    var termCount: Int
}

final class TermMainCollectionlViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private var cellModel: TermModel?
    var cellId: Int = -1
    var count: Int = 0 
    
    // MARK: - UI Components
    
    private var backgroundImageView = UIImageView()
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
    
    lazy var didTap: () -> Void = { [weak self] in
        self?.contentView.alpha -= 0.15
        self?.cellModel?.termCount += 1
        if self?.cellModel?.termCount ?? 0 > 7 {
            self?.contentView.isHidden = true
        }
    }

}

// Interface
extension TermMainCollectionlViewCell {
    func configure(model: TermModel) {
        self.termLabel.text = model.termContentEng
        self.backgroundImageView.addGestureRecognizer(.init(target: self, action: #selector(opa)))
    }
    
    @objc func opa() {
        self.contentView.alpha -= 0.15
    }
}

// MARK: - Extensions

private extension TermMainCollectionlViewCell {
    func setupStyle() {
        setCellBackgroundImage()
        
        termLabel.do {
            $0.font = .pretendardMedium(size: 16)
            $0.textColor = .black
            $0.numberOfLines = 2
            $0.textAlignment = .center
        }
    }
    
    func setupHierarchy() {
        [backgroundImageView, termLabel].forEach { self.contentView.addSubview($0) }
    }
    
    func setupLayout() {
        backgroundImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        termLabel.snp.makeConstraints {
            $0.leading.top.equalToSuperview().offset(5)
            $0.trailing.bottom.equalToSuperview().offset(-5)
        }
    }
}

private extension TermMainCollectionlViewCell {
    func setCellBackgroundImage() {
        self.backgroundImageView.image = UIImage(named: "img_cellIBackground\(Int.random(in: 1...7))")
    }
}
