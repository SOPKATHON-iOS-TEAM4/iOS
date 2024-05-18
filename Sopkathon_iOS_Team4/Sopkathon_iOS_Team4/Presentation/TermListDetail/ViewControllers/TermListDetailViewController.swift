//
//  TermListDetailViewController.swift
//  Sopkathon_iOS_Team4
//
//  Created by 박민서 on 5/19/24.
//

import UIKit

import Then
import SnapKit

final class TermListDetailViewController: UIViewController {
    
    // MARK: - Properties
    private var termList: [TermModel] = [
        TermModel(termId: 1, termContentEng: "Term One", termContentKor: "용어 하나", termCount: 10),
        TermModel(termId: 2, termContentEng: "Term Two", termContentKor: "용어 둘", termCount: 20),
        TermModel(termId: 3, termContentEng: "Term Three", termContentKor: "용어 셋", termCount: 30),
        TermModel(termId: 4, termContentEng: "Term Four", termContentKor: "용어 넷", termCount: 40),
        TermModel(termId: 5, termContentEng: "Term Five", termContentKor: "용어 다섯", termCount: 50),
        TermModel(termId: 6, termContentEng: "Term Six", termContentKor: "용어 여섯", termCount: 60),
        TermModel(termId: 7, termContentEng: "Term Seven", termContentKor: "용어 일곱", termCount: 70),
        TermModel(termId: 8, termContentEng: "Term Eight", termContentKor: "용어 여덟", termCount: 80),
        TermModel(termId: 9, termContentEng: "Term Nine", termContentKor: "용어 아홉", termCount: 90),
        TermModel(termId: 10, termContentEng: "Term Ten", termContentKor: "용어 열", termCount: 100)
    ]
    
    // MARK: - UI Components
    private let termView: TermListDetailView = TermListDetailView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = termView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        termView.termMainCollectionView.delegate = self
        termView.termMainCollectionView.dataSource = self
    }
    
}

private extension TermListDetailViewController {
    func setupNavigationBar() {
        
        self.title = "제목"
        
        let leftBarButton = UIBarButtonItem(title: "Left", style: .plain, target: self, action: #selector(leftBarButtonTapped))
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        
        let rightBarButton1 = UIBarButtonItem(title: "Right1", style: .plain, target: self, action: #selector(rightBarButtonTapped))
        let rightBarButton2 = UIBarButtonItem(title: "Right2", style: .plain, target: self, action: #selector(rightBarButtonTapped))
        self.navigationItem.rightBarButtonItems = [rightBarButton2, rightBarButton1]
    }
    
    @objc private func leftBarButtonTapped() {
        print("Left bar button tapped")
    }
    
    @objc private func rightBarButtonTapped() {
        print("Right bar button tapped")
    }
}

extension TermListDetailViewController: UICollectionViewDelegate {
    
}

extension TermListDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(termList.count)
        return termList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TermMainCollectionlViewCell.className, for: indexPath) as? TermMainCollectionlViewCell else { return UICollectionViewCell() }
        return cell
    }
}
