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
    
    private let cvBackgroundView = UIView()
    
    private let termMainCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout().then {
        
        $0.itemSize = CGSize(width: 70, height: 30)
        
        $0.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        
        $0.minimumInteritemSpacing = 10
        $0.minimumLineSpacing = 10
        $0.scrollDirection = .vertical
    })
    
    private let countLabelBackgroundView = UIView()
    
    private let termListCount = UILabel()
    
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
}

// MARK: - Extensions

private extension TermListDetailView {
    func setupStyle() {
        cvBackgroundView.do {
            $0.backgroundColor = .grayscale70
            $0.makeRounded(radius: 20)
        }
        
        countLabelBackgroundView.do {
            $0.backgroundColor = .grayscale70
            $0.makeRounded(radius: 20)
        }
        
        termListCount.do {
            $0.font = .pretendardMedium(size: 16)
            $0.textColor = .grayscale50
        }
    }
    
    func setupHierarchy() {
        [
            cvBackgroundView,
            termMainCollectionView,
            countLabelBackgroundView,
            termListCount
        ].forEach { self.addSubviews($0) }
    }
    
    func setupLayout() {
        cvBackgroundView.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(60)
            $0.trailing.equalToSuperview().offset(-60)
            $0.top.equalTo(self.safeAreaLayoutGuide).offset(130)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).offset(-96)
        }
        
        termMainCollectionView.snp.makeConstraints {
            $0.edges.equalTo(cvBackgroundView)
        }
        
        termListCount.snp.makeConstraints {
            $0.top.equalTo(cvBackgroundView).offset(35)
            $0.centerX.equalToSuperview()
        }
        
        countLabelBackgroundView.snp.makeConstraints {
            $0.center.equalTo(countLabelBackgroundView)
            $0.leading.equalTo(termListCount).inset(15)
            $0.trailing.equalTo(termListCount).inset(-15)
            $0.top.equalTo(termListCount).inset(9)
            $0.bottom.equalTo(termListCount).inset(-9)
        }
        
    }
}
