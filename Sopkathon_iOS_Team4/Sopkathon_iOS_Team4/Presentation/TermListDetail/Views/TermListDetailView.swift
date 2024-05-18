//
//  TermListDetailView.swift
//  Sopkathon_iOS_Team4
//
//  Created by 박민서 on 5/19/24.
//

import UIKit

import SnapKit
import Then

final class TermListDetailView: UIView {
    
    // MARK: - Properties
    private var termList: [TermModel] = []
    
    // MARK: - UI Components
    
    private let cvBackgroundImageView = UIImageView()
    
    let termMainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        $0.itemSize = CGSize(width: 70, height: 70)
        $0.sectionInset = UIEdgeInsets(top: 30, left: 10, bottom: 10, right: 10)
        $0.minimumInteritemSpacing = 10
        $0.minimumLineSpacing = 10
        $0.scrollDirection = .vertical
    })
    
    private let countLabelBackgroundView = UIView()
    
    private let termListCount = UILabel()
    
    private let termToastView: TermDetailToastView = TermDetailToastView()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
        
        termMainCollectionView.register(TermMainCollectionlViewCell.self, forCellWithReuseIdentifier: TermMainCollectionlViewCell.className)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

private extension TermListDetailView {
    func setupStyle() {
        cvBackgroundImageView.do {
            $0.image = UIImage(named: "img_collectionViewBackground")
//            $0.backgroundColor = .grayscale70
            $0.makeRounded(radius: 20)
        }
        
        termMainCollectionView.do {
            $0.backgroundColor = .clear
        }
        
        countLabelBackgroundView.do {
            $0.backgroundColor = .grayscale70
            $0.makeRounded(radius: 2)
        }
        
        termListCount.do {
            $0.text = "0/10"
            $0.font = .pretendardMedium(size: 16)
            $0.textColor = .grayscale50
        }
        
        termToastView.do {
            $0.configure(model: self.termList.first ?? .init(termId: 1, termContentEng: "test", termContentKor: "테스트", termCount: 0))
        }
    }
    
    func setupHierarchy() {
        [
            cvBackgroundImageView,
            termMainCollectionView,
            countLabelBackgroundView,
            termListCount,
            termToastView
        ].forEach { self.addSubviews($0) }
    }
    
    func setupLayout() {
        cvBackgroundImageView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(60)
            $0.trailing.equalToSuperview().offset(-60)
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(130)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-96)
        }
        
        termMainCollectionView.snp.makeConstraints {
            $0.edges.equalTo(cvBackgroundImageView).inset(10)
            $0.bottom.equalTo(cvBackgroundImageView).inset(20)
        }
        
        termListCount.snp.makeConstraints {
            $0.top.equalTo(termMainCollectionView.snp.bottom).offset(35)
            $0.centerX.equalToSuperview()
        }
        
        countLabelBackgroundView.snp.makeConstraints {
            $0.center.equalTo(termListCount)
            $0.width.equalTo(termListCount).multipliedBy(1.5)
            $0.height.equalTo(termListCount).multipliedBy(1.5)
        }
        
        termToastView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(24)
            $0.trailing.equalToSuperview().offset(-24)
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(16)
            $0.height.equalTo(80)
        }
    }
}
