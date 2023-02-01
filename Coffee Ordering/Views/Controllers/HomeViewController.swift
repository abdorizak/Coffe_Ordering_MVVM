//
//  HomeViewController.swift
//  Coffee Ordering
//
//  Created by Abdirizak Hassan on 1/29/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(CoffeOrderingCell.self, forCellReuseIdentifier: CoffeOrderingCell.identifier)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configVC()
    }
    
    private func configVC() {
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        configNav()
        configTableView()
    }
    private func configNav() {
        navigationItem.title = "Orders"
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addOrder))
    }
    
    @objc func addOrder() {
        let addOrderVC = UINavigationController(rootViewController: AddOrderViewController())
        addOrderVC.modalTransitionStyle = .coverVertical
        addOrderVC.modalPresentationStyle = .pageSheet
        present(addOrderVC, animated: true)
    }
    
    private func configTableView(){
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }


}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CoffeOrderingCell.identifier, for: indexPath) as! CoffeOrderingCell
        cell.displayData()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        44
    }
}

