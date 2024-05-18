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
    
    enum Section {
        case main
    }
    
    // MARK: - UI Properties
    
    let termTextField = UITextField()
    
    let numOfTermLabel = UILabel()
    
    let termMeaningTextField = UITextField()
    
    let numOfTermMeaningLabel = UILabel()
    
    lazy var confirmButton = UIButton()
    
    private let termLabel = UILabel()
    
    private let termMeaningLabel = UILabel()
    
    private let addedTermCollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout())
    
    // MARK: - Properties
    
    var addedTermList = AddedTerm.list 
    
    private var dataSource: UICollectionViewDiffableDataSource<Section, AddedTerm>!

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
            $0.textColor = .white0
        }
        
        numOfTermLabel.do {
            $0.text = "0/20"
            $0.font = .pretendardMedium(size: 12)
            $0.textColor = .grayscale60
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
            $0.textColor = .white0
        }
        
        numOfTermMeaningLabel.do {
            $0.text = "0/20"
            $0.font = .pretendardMedium(size: 12)
            $0.textColor = .grayscale60
        }
        
        addedTermCollectionView.do {
            $0.register(AddedTermCell.self, forCellWithReuseIdentifier: AddedTermCell.className)
            $0.backgroundColor = .none
            $0.showsHorizontalScrollIndicator = false
        }
        
        confirmButton.do {
            let attrStr = NSAttributedString(
                            string: "확인",
                            attributes: [
                                .font : UIFont.pretendardSemiBold(size: 16),
                                .foregroundColor : UIColor.grayscale90
                            ])
            $0.setAttributedTitle(attrStr, for: .normal)
            $0.setBackgroundColor(.grayscale50, for: .normal)
            $0.layer.cornerRadius = 15
        }
    }
    
    private func setHierarchy() {
        [
            termLabel,
            termTextField,
            termMeaningLabel,
            termMeaningTextField,
            numOfTermLabel,
            numOfTermMeaningLabel,
            addedTermCollectionView,
            confirmButton
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
        
        numOfTermLabel.snp.makeConstraints {
            $0.top.equalTo(termTextField.snp.bottom).offset(10)
            $0.trailing.equalTo(termTextField).offset(-6)
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
        
        numOfTermMeaningLabel.snp.makeConstraints {
            $0.top.equalTo(termMeaningTextField.snp.bottom).offset(10)
            $0.trailing.equalTo(termMeaningTextField).offset(-6)
        }
        
        addedTermCollectionView.snp.makeConstraints {
            $0.top.equalTo(termMeaningTextField).offset(296)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(35)
        }
        
        confirmButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-22)
            $0.height.equalTo(56)
        }
    }
}

// MARK: - UICollectionView Setting

extension AddTermView {
    func configureCollectionView() {
        dataSource = UICollectionViewDiffableDataSource(
            collectionView: addedTermCollectionView,
            cellProvider: { collectionView, indexPath, item in
                guard let cell = collectionView.dequeueReusableCell(
                    withReuseIdentifier: AddedTermCell.className,
                    for: indexPath) as? AddedTermCell
                else {
                    return nil
                }
                
                cell.dataBind(item)
                return cell
            })
        
        putsnapshotData()
        
        addedTermCollectionView.collectionViewLayout = setCollectionViewLayout()
    }
    
    func putsnapshotData() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, AddedTerm>()
        snapshot.appendSections([.main])
        snapshot.appendItems(addedTermList, toSection: .main)
        dataSource.apply(snapshot)
    }
    
    func setCollectionViewLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(80), heightDimension: .absolute(32))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(80), heightDimension: .fractionalHeight(1.0))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 10
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}
