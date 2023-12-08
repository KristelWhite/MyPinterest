//
//  SearchViewController.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 07.11.2023.
//

import UIKit

class SearchViewController: UIViewController, UIGestureRecognizerDelegate {
    
//    MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearence()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureNavigation()
    }
}


//MARK: - UIViewController

private extension SearchViewController {
    
    func configureAppearence() {
        
    }
    
    func configureNavigation() {
        navigationItem.title = "Search"
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: navigationController, action: #selector(navigationController?.popViewController(animated:)))
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.interactivePopGestureRecognizer?.delegate = self
    }
}
