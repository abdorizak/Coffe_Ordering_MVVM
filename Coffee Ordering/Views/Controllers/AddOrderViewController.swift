//
//  AddOrderViewController.swift
//  Coffee Ordering
//
//  Created by Abdirizak Hassan on 2/1/23.
//

import UIKit

class AddOrderViewController: UIViewController {
    
    
    private let select_Coffe_Type = UISegmentedControl(items: ["Small", "Medium", "Large"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configVC()
    }
    
    private func configVC() {
        view.backgroundColor = .systemBackground
        title = "Add Order"
        view.addSubViews(select_Coffe_Type)
        configCoffeType()
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

}
