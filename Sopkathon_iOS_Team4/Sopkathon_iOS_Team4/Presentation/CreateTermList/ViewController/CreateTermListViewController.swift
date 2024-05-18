//
//  CreateTermListViewController.swift
//  Sopkathon_iOS_Team4
//
//  Created by 왕정빈 on 5/19/24.
//

import UIKit

import Then

final class CreateTermListViewController: UIViewController {
    
    // MARK: - Properties
    
    private let rootView = CreateTermListView()
    
    private var termList = ""

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTextField()
    }
    
    override func loadView() {
        view = rootView
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
}
