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
    
    let service = APIService<HomeAPIService>()
    
    // MARK: - Properties
    private var termList: [TermModel] = [
        TermModel(termId: 1, termContentEng: "Term One", termContentKor: "용어 하나", termCount: 0),
        TermModel(termId: 2, termContentEng: "Term Two", termContentKor: "용어 둘", termCount: 0),
        TermModel(termId: 3, termContentEng: "Term Three", termContentKor: "용어 셋", termCount: 0),
        TermModel(termId: 4, termContentEng: "Term Four", termContentKor: "용어 넷", termCount: 0),
        TermModel(termId: 5, termContentEng: "Term Five", termContentKor: "용어 다섯", termCount: 0),
        TermModel(termId: 6, termContentEng: "Term Six", termContentKor: "용어 여섯", termCount: 0),
        TermModel(termId: 7, termContentEng: "Term Seven", termContentKor: "용어 일곱", termCount: 70),
        TermModel(termId: 8, termContentEng: "Term Eight", termContentKor: "용어 여덟", termCount: 80),
        TermModel(termId: 9, termContentEng: "Term Nine", termContentKor: "용어 아홉", termCount: 90),
        TermModel(termId: 10, termContentEng: "Term Ten", termContentKor: "용어 열", termCount: 100),
        TermModel(termId: 11, termContentEng: "Term One", termContentKor: "용어 하나", termCount: 10),
        TermModel(termId: 12, termContentEng: "Term Two", termContentKor: "용어 둘", termCount: 20),
        TermModel(termId: 13, termContentEng: "Term Three", termContentKor: "용어 셋", termCount: 30),
        TermModel(termId: 14, termContentEng: "Term Four", termContentKor: "용어 넷", termCount: 40),
        TermModel(termId: 15, termContentEng: "Term Five", termContentKor: "용어 다섯", termCount: 50),
        TermModel(termId: 16, termContentEng: "Term Six", termContentKor: "용어 여섯", termCount: 60),
        TermModel(termId: 17, termContentEng: "Term Seven", termContentKor: "용어 일곱", termCount: 70),
        TermModel(termId: 18, termContentEng: "Term Eight", termContentKor: "용어 여덟", termCount: 80),
        TermModel(termId: 19, termContentEng: "Term Nine", termContentKor: "용어 아홉", termCount: 90),
        TermModel(termId: 20, termContentEng: "Term Ten", termContentKor: "용어 열", termCount: 100)
    ]
    
    // MARK: - UI Components
    private let termView: TermListDetailView = TermListDetailView()
    
    // MARK: - Life Cycles
    
    override func loadView() {
        self.view = termView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        service.getTermList(categoryId: 1)
        self.termView.termToastView.isHidden = true
        service.sendRequest(
            target: .getTermList(categoryId: 1),
            instance: Response_GetTermListDTO.self,
            completion: {
                result in
                switch result {
                    
                case .success(let result):
//                    print(result.result)
                    self.termList = result.result.map {
                        TermModel.init(
                            termId: $0.wordID,
                            termContentEng: $0.vocabulary,
                            termContentKor: $0.meaning,
                            termCount: $0.clickCount
                        )
                    }
                    self.termView.termMainCollectionView.reloadData()
                case .failure(let error):
                    print(error)
                }
            }
        )
        termView.termMainCollectionView.delegate = self
        termView.termMainCollectionView.dataSource = self
        setupNavigationBar()
        
        NotificationCenter.default.addObserver(self, selector: #selector(deleteCell(_:)), name: Notification.Name("deleteThis"), object: nil)
    }
    
    deinit {
            // 알림 해제
            NotificationCenter.default.removeObserver(self, name: Notification.Name("deleteThis"), object: nil)
        }
    
    @objc func deleteCell(_ notification: Notification) {
            if let userInfo = notification.userInfo, let id = userInfo["id"] as? Int {
                print("Received ID: \(id)")
                // 셀 삭제
                self.termList.remove(at: id)
            }
        }
    
}

private extension TermListDetailViewController {
    // API LOGIC
}

private extension TermListDetailViewController {
    func setupNavigationBar() {
        self.title = "인사할 때 사용"
        
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.barTintColor = .black // 배경색을 설정할 수 있습니다. 필요에 따라 변경하세요.
            navigationBar.isTranslucent = false
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationBar.tintColor = .white // 아이템의 틴트 컬러를 하얀색으로 설정
        }
        
        let leftImage = UIImage(named: "ic_back")
        let leftBarButton = UIBarButtonItem(image: leftImage, style: .plain, target: self, action: #selector(leftBarButtonTapped))
        self.navigationItem.leftBarButtonItem = leftBarButton
        
        let rightImage1 = UIImage(named: "ic_edit")
        let rightBarButton1 = UIBarButtonItem(image: rightImage1, style: .plain, target: self, action: #selector(rightBarButtonTapped))
        
        
        let rightImage2 = UIImage(named: "ic_calendar")
        let rightBarButton2 = UIBarButtonItem(image: rightImage2, style: .plain, target: self, action: #selector(rightBarButtonTapped))
        

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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TermMainCollectionlViewCell.className, for: indexPath) as? TermMainCollectionlViewCell else { return }
        self.termView.termToastView.isHidden = false
        self.termView.termToastView.fetchData(
            .init(
                termId: termList[indexPath.row].termId,
                termContentEng: termList[indexPath.row].termContentEng,
                termContentKor: termList[indexPath.row].termContentKor,
                termCount: termList[indexPath.row].termCount
            )
        )
        cell.count += 1
    }
}

extension TermListDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return termList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TermMainCollectionlViewCell.className, for: indexPath) as? TermMainCollectionlViewCell else { return UICollectionViewCell() }
        cell.configure(model: termList[indexPath.row])
        cell.cellId = indexPath.row
        cell.count = termList[indexPath.row].termCount
        return cell
    }
}
