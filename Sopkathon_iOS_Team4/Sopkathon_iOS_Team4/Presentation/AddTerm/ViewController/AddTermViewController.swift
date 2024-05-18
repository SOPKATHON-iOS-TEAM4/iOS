//
//  AddTermViewController.swift
//  Sopkathon_iOS_Team4
//
//  Created by 왕정빈 on 5/19/24.
//

import UIKit

final class AddTermViewController: UIViewController {

    // MARK: - Properties
    
    private let rootView = AddTermView()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view = rootView
    }
    
}
