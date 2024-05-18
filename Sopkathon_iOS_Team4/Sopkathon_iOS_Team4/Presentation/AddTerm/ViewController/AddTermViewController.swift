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
//        dismiss(animated: true)
        delegate?.dataBind(term: term, termMeaning: termMeaning)
        rootView.addedTermList.insert(AddedTerm(
            term: rootView.termTextField.text ?? "",
            termMeaning: rootView.termMeaningTextField.text ?? ""), at: 0)
        rootView.putsnapshotData()
    }
}
