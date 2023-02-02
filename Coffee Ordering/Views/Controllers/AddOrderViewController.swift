//
//  AddOrderViewController.swift
//  Coffee Ordering
//
//  Created by Abdirizak Hassan on 2/1/23.
//

import UIKit

class AddOrderViewController: UIViewController {
    
    
    private let select_Coffe_Type = UISegmentedControl(items: ["Small", "Medium", "Large"])
    private let first_name = TextField("First Name")
    private let last_name = TextField("Last Name")
    
    var is_Type_Selected: Bool = false
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configVC()
    }
    
    private func configVC() {
        view.backgroundColor = .systemBackground
        view.addSubViews(select_Coffe_Type, first_name, last_name, tableView)
        tableView.dataSource = self
        tableView.delegate = self
        configCoffeType()
        configTextFeilds()
        configTableView()
        configNav()
        dismissKeyboard()
    }
    
    private func configNav() {
        title = "Add Order"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "save", style: .done, target: self, action: #selector(didTapSave))
    }
    
    private func configCoffeType() {
        let font = UIFont.systemFont(ofSize: 18)
        select_Coffe_Type.setTitleTextAttributes([NSAttributedString.Key.font: font], for: .normal)
        select_Coffe_Type.translatesAutoresizingMaskIntoConstraints = false
        select_Coffe_Type.backgroundColor  = .tertiarySystemBackground
        select_Coffe_Type.addTarget(self, action: #selector(siutDidChange(_:)), for: .valueChanged)
        select_Coffe_Type.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            select_Coffe_Type.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            select_Coffe_Type.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            select_Coffe_Type.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            select_Coffe_Type.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    @objc func siutDidChange(_ segmentController: UISegmentedControl) {
        switch segmentController.selectedSegmentIndex {
        case 0:
            is_Type_Selected.toggle()
            print("Tapped")
            segmentController.selectedSegmentTintColor = UIColor(hex: "ed1e26")
        case 1:
            print("Tapped")
            segmentController.selectedSegmentTintColor = UIColor(hex: "00adf1")
        case 2:
            print("Tapped")
            segmentController.selectedSegmentTintColor = UIColor(hex: "3cb34b")
        default: break
        }
    }
    
    private func configTextFeilds() {
        [first_name, last_name].forEach {
            $0.backgroundColor = .tertiarySystemGroupedBackground
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 8
            $0.textAlignment = .center
        }
        NSLayoutConstraint.activate([
            first_name.topAnchor.constraint(equalTo: select_Coffe_Type.bottomAnchor, constant: 30),
            first_name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            first_name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            first_name.heightAnchor.constraint(equalToConstant: 55),
            
            last_name.topAnchor.constraint(equalTo: first_name.bottomAnchor, constant: 10),
            last_name.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            last_name.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            last_name.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
    
    private func configTableView() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: last_name.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func dismissKeyboard() {
        let tapgesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapgesture)
    }
    
    @objc func didTapSave() {
        print("Tapped")
    }
}

extension AddOrderViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        var config = cell.defaultContentConfiguration()
        config.text = "\(indexPath.row + 1)"
        cell.contentConfiguration = config
        return cell
    }
    
    
}
