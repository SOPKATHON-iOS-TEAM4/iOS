//
//  MainViewController.swift
//  Sopkathon_iOS_Team4
//
//  Created by Gahyun Kim on 2024/05/19.
//

import UIKit

final class MainViewController: UIViewController {
    
    
    // MARK: - Properties
    
    private var datadummy = MainModel.dummy()
    
    // MARK: - UI Components
    
    private let rootView = MainView()
    
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegate()
        setupRegister()
        setaddTarget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
    }
}


private extension MainViewController {
    func setupDelegate() {
        rootView.termListTableView.delegate = self
        rootView.termListTableView.dataSource = self
    }
    
    func setupRegister() {
        rootView.termListTableView.register(TermListTableViewCell.self,
                                            forCellReuseIdentifier: TermListTableViewCell.className)
    }
    
    func setaddTarget() {
        rootView.addButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        // icknameView.saveButton.addTarget(self, action: #selector(saveButtonDidTap), for: .touchUpInside)
    }
}

// MARK: - TableView

extension MainViewController: UITableViewDelegate {
}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datadummy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TermListTableViewCell.className, for: indexPath) as? TermListTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        let data = datadummy[indexPath.item]
        cell.configureCell(forModel: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 103
    }
}


// MARK: - Network

extension MainViewController {
    @objc func buttonTapped() {
        print("SAVE BUTTON TAPPED")
        // TODO: - 단어장 추가 ViewController 연결
        //        let vc = ViewController()
        //        self.navigationController?.pushViewController(vc, animated: true)
    }
}

