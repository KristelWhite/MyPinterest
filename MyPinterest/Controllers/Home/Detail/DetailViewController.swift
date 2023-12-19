//
//  DetailViewController.swift
//  MyPinterest
//
//  Created by Кристина Пастухова on 07.12.2023.
//

import UIKit

class DetailViewController: UIViewController, UIGestureRecognizerDelegate {
    
//    MARK: - Actions
    
    @objc func searchButtonTapped(){
        self.navigationController?.pushViewController(SearchViewController(), animated: true)
    }
    
//    MARK: - Properties
    
    var model: ItemModel?
    
    var tableView = UITableView()
    
//    MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configurateNavigation()
    }
}

// MARK: - UIViewController

private extension DetailViewController {
    
    func configureAppearance() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor)])
        tableView.register(UINib(nibName: "\(DetailImageTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(DetailImageTableViewCell.self)")
        tableView.register(UINib(nibName: "\(DetailTitleTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(DetailTitleTableViewCell.self)")
        tableView.register(UINib(nibName: "\(DetailTextTableViewCell.self)", bundle: .main), forCellReuseIdentifier: "\(DetailTextTableViewCell.self)")
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    func configurateNavigation() {
        navigationItem.title = model?.title
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "backButton"), style: .plain, target: navigationController, action: #selector(navigationController?.popViewController(animated:)))
        navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(searchButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
}

// MARK: -  DataSource

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(DetailImageTableViewCell.self)")  as? DetailImageTableViewCell
            guard let cell = cell else { return UITableViewCell()}
            cell.imageURLInString = model?.imageURLInString ?? ""
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(DetailTitleTableViewCell.self)") as? DetailTitleTableViewCell
            guard let cell = cell else { return UITableViewCell() }
            cell.title = model?.title
            cell.date = model?.creationDate
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "\(DetailTextTableViewCell.self)") as? DetailTextTableViewCell
            guard let cell = cell else { return UITableViewCell() }
            cell.text = model?.content
            return cell
        default :
            return UITableViewCell()
        }
    }
    
    
}
