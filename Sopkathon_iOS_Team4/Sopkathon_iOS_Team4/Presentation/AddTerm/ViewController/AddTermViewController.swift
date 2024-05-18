//
//  AddTermViewController.swift
//  Sopkathon_iOS_Team4
//
//  Created by 왕정빈 on 5/19/24.
//

import UIKit

protocol TermDataBindDelegate: AnyObject {
    func dataBind(term: String?, termMeaning: String?)
}

final class AddTermViewController: UIViewController {

    // MARK: - Properties
    
    weak var delegate: TermDataBindDelegate?
    
    private let rootView = AddTermView()
    
    private let addedTermCell = AddedTermCell()
    
    private var term = ""
    
    private var termMeaning = ""
    
    private let testService = APIService<HomeAPIService>()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rootView.configureCollectionView()
        setInitial()
        setTextField()
        setButtonAction()
    }
    
    override func loadView() {
        view = rootView
    }
    
    // MARK: - Initial Setting
    
    private func setInitial() {
        title = "단어 추가"
        
        if let navigationBar = self.navigationController?.navigationBar {
            navigationBar.barTintColor = .black // 배경색을 설정할 수 있습니다. 필요에 따라 변경하세요.
            navigationBar.isTranslucent = false
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            navigationBar.tintColor = .white // 아이템의 틴트 컬러를 하얀색으로 설정
        }
        
        let leftImage = UIImage(named: "ic_back")
        let leftBarButton = UIBarButtonItem(image: leftImage, style: .plain, target: self, action: #selector(leftBarButtonTapped))
        self.navigationItem.leftBarButtonItem = leftBarButton
    }
    
    @objc private func leftBarButtonTapped() {
        print("Left bar button tapped")
    }
    
    // MARK: - TextField  Setting
    
    private func setTextField() {
        rootView.termTextField.addTarget(self, action: #selector(termTextFieldDidChange), for: .editingChanged)
        rootView.termMeaningTextField.addTarget(self, action: #selector(termMeaningTextFieldDidChange), for: .editingChanged)
    }
    
    @objc func termTextFieldDidChange(_ textField: UITextField) {
        term = textField.text ?? ""
        rootView.numOfTermLabel.text = "\(term.count)/20"
        setButtonAttributes()
    }
    
    @objc func termMeaningTextFieldDidChange(_ textField: UITextField) {
        termMeaning = textField.text ?? ""
        rootView.numOfTermMeaningLabel.text = "\(termMeaning.count)/20"
        setButtonAttributes()
    }
    
    private func isValidForTerm(englishTerm: String) -> Bool {
        let regex = "^[A-Za-z]{1,20}$"
        let termTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return termTest.evaluate(with: englishTerm)
    }
    
    private func isValidForTermMeaning(englishTerm: String) -> Bool {
        let regex = "^[가-힣]{1,20}$"
        let termTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return termTest.evaluate(with: englishTerm)
    }
    
    // MARK: - Button Setting
    
    private func setButtonAttributes() {
        if isValidForTerm(englishTerm: term) && isValidForTermMeaning(englishTerm: termMeaning) {
            rootView.confirmButton.setBackgroundColor(.white0, for: .normal)
            rootView.confirmButton.isEnabled = true
        } else {
            rootView.confirmButton.setBackgroundColor(.grayscale50, for: .normal)
            rootView.confirmButton.isEnabled = false
        }
    }
    
    private func setButtonAction() {
        rootView.confirmButton.addTarget(self, action: #selector(createButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func createButtonDidTap() {
        delegate?.dataBind(term: term, termMeaning: termMeaning)
        rootView.addedTermList.insert(AddedTerm(
            term: rootView.termTextField.text ?? "",
            termMeaning: rootView.termMeaningTextField.text ?? ""), at: 0)
        rootView.putsnapshotData()
    }
}

// MARK: - 네트워크 연결

extension AddTermViewController {
    func postNewTerm(
        categoryId: Int,
        vocabulary: String,
        meaning: String
    ) {
        testService.sendRequest(
            target: .postNewTerm(categoryId: categoryId, vocabulary: vocabulary, meaning: meaning),
            instance: Response_PostNewTermDTO.self,
            completion: { result in
                switch result {
                    
                case .success(let result):
                    print(result.success)
                case .failure(let error):
                    print(error)
                }
            }
        )
    }
}
