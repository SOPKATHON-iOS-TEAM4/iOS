//
//  TermHistoryViewController.swift
//  Sopkathon_iOS_Team4
//
//  Created by 오연서 on 5/19/24.
//

import UIKit

import SnapKit
import Then

final class TermHistoryViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    let navigationBar = UINavigationBar().then{
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private let termHistoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 313, height: 97)
        layout.minimumLineSpacing = 15
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        return collectionView
    }()
    
    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupHierachy()
        setupLayout()
        setDelegate()
        setRegister()
        setNavigationBar()
    }
    
    private func setupHierachy() {
        self.view.addSubview(navigationBar)
        self.view.addSubview(termHistoryCollectionView)
    }
    
    private func setupLayout() {
        navigationBar.snp.makeConstraints{
            $0.top.equalToSuperview().inset(46)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(44)
        }
        termHistoryCollectionView.snp.makeConstraints{
            $0.top.equalTo(navigationBar.snp.bottom).offset(16)
            $0.bottom.horizontalEdges.equalToSuperview()
        }
    }
    
    private func setDelegate() {
        termHistoryCollectionView.delegate = self
        termHistoryCollectionView.dataSource = self
    }
    
    private func setRegister() {
        termHistoryCollectionView.register(TermHistoryCollectionViewCell.self,
                                           forCellWithReuseIdentifier: TermHistoryCollectionViewCell.className)
    }
    
    private func setNavigationBar() {
        let navItem = UINavigationItem(title: "단어장")

        let titleAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.pretendardSemiBold(size: 16)
        ]
        navigationBar.titleTextAttributes = titleAttributes
        
        let backButtonImage = UIImage(named: "ic_back")?.withRenderingMode(.alwaysTemplate)
        let backButton = UIBarButtonItem(image: backButtonImage, style: .plain, target: self, action: #selector(tapDismissButton))
        backButton.tintColor = .grayscale20
        
        navItem.leftBarButtonItem = backButton
        
        navigationBar.setItems([navItem], animated: true)
        navigationBar.barTintColor = .black
    }
    
    @objc func tapDismissButton(){
        
    }
}

extension TermHistoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TermHistoryCollectionViewCell.className, for: indexPath) as? TermHistoryCollectionViewCell
        else { return UICollectionViewCell() }
        return cell
    }
}
