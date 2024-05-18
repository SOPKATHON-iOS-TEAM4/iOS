//
//  MainView.swift
//  Sopkathon_iOS_Team4
//
//  Created by Gahyun Kim on 2024/05/19.
//

import UIKit

import SnapKit
import Then

final class MainView: UIView {
    
    // MARK: - Properties
    
    private let datadummy = MainModel.dummy()
    
    // MARK: - UI Components
    
    let termListTableView = UITableView()
    let addButton = UIButton()
    private let logoImageView = UIImageView()
    
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

private extension MainView {
    func setupStyle() {
        self.backgroundColor = .grayscale80
        
        termListTableView.do {
            $0.backgroundColor = .clear
        }
        
        addButton.do {
            $0.backgroundColor = .white
            $0.setImage(.imgAddButton, for: .normal)
            $0.layer.cornerRadius = 14
        }
        
        logoImageView.do {
            $0.image = .imgTermblur
        }
    }
    
    func setupHierarchy() {
        addSubviews(logoImageView, termListTableView, addButton)
    }
    
    func setupLayout() {
        logoImageView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.leading.equalToSuperview().inset(24)
        }
        
        termListTableView.snp.makeConstraints {
            $0.top.equalTo(logoImageView.snp.bottom).offset(34)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(UIScreen.main.bounds.size.width)
            $0.height.equalTo(103 * datadummy.count)
        }
        
        addButton.snp.makeConstraints {
            $0.top.equalTo(termListTableView.snp.bottom).offset(16)
            $0.horizontalEdges.equalToSuperview().inset(24)
            $0.height.equalTo(58)
        }
    }
}

