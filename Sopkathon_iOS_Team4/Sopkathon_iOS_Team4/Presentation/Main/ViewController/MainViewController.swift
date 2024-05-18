//
//  MainViewController.swift
//  Sopkathon_iOS_Team4
//
//  Created by Gahyun Kim on 2024/05/19.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    let testService = APIService<HomeAPIService>()
    var result1data : [Result1] = []
   
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
        
        getCategoryList()
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
    }
}

extension MainViewController: UITableViewDelegate {
    
}
// MARK: - TableView

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return result1data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TermListTableViewCell.className, for: indexPath) as? TermListTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        let data = result1data[indexPath.item]
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

extension MainViewController {
    func getCategoryList() {
        testService.sendRequest(
            target: .getCategoryList,
            instance: Response_GetCategoryListDTO.self,
            completion: {  result in
                switch result {
                case .success(let result):
                    self.result1data = result.result
                    self.rootView.termListTableView.reloadData()
                    self.rootView.termListTableView.snp.remakeConstraints {
                        $0.top.equalTo(self.rootView.logoImageView.snp.bottom).offset(34)
                        $0.centerX.equalToSuperview()
                        $0.width.equalTo(UIScreen.main.bounds.size.width)
                        $0.height.equalTo(self.result1data.count * 103)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        )
    }
}
