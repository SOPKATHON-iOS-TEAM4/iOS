//
//  CreateTermListViewController.swift
//  Sopkathon_iOS_Team4
//
//  Created by 왕정빈 on 5/19/24.
//

import UIKit

final class CreateTermListViewController: UIViewController {
    
    // MARK: - Properties
    
    private let rootView = CreateTermListView()

    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = rootView
    }
    
}
