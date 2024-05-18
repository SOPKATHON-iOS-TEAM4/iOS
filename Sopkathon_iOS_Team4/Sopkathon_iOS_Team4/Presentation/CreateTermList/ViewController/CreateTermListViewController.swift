//
//  CreateTermListViewController.swift
//  Sopkathon_iOS_Team4
//
//  Created by 왕정빈 on 5/19/24.
//

import UIKit

protocol TermListDataBindDelegate: AnyObject {
    func dataBind(termList: String?)
}

final class CreateTermListViewController: UIViewController {
    
    // MARK: - Properties
    
    weak var delegate: TermListDataBindDelegate?
    
    private let rootView = CreateTermListView()
    
    private var termList = ""
    
    private let testService = APIService<HomeAPIService>()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setInitial()
        setTextField()
        setButtonAction()
    }
    
    override func loadView() {
        view = rootView
    }
    
    // MARK: - Initial Setting
    
    private func setInitial() {
        title = "단어장 추가"
        
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
        rootView.termListTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        termList = textField.text ?? ""
        rootView.numOfTermListLabel.text = "\(termList.count)/20"
        setButtonAttributes()
    }
    
    private func isValid(englishTerm: String) -> Bool {
        let regex = "^.{1,20}$"
        let termTest = NSPredicate(format: "SELF MATCHES %@", regex)
        return termTest.evaluate(with: englishTerm)
    }
    
    // MARK: - Button Setting
    
    private func setButtonAttributes() {
        if isValid(englishTerm: termList) {
            rootView.createButton.setBackgroundColor(.white0, for: .normal)
            rootView.createButton.isEnabled = true
        } else {
            rootView.createButton.setBackgroundColor(.grayscale50, for: .normal)
            rootView.createButton.isEnabled = false
        }
    }
    
    private func setButtonAction() {
        rootView.createButton.addTarget(self, action: #selector(createButtonDidTap), for: .touchUpInside)
    }
    
    @objc
    private func createButtonDidTap() {
    }
}
