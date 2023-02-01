//
//  CoffeOrderingCell.swift
//  Coffee Ordering
//
//  Created by Abdirizak Hassan on 2/1/23.
//

import UIKit

// large: 3cb34b
// medium: 00adf1
// small: ed1e26

class CoffeOrderingCell: UITableViewCell {
    
    static let identifier = String(describing: CoffeOrderingCell.self)
    
    private let coffe_name = Label(Title: .left, fontSize: 16)
    private let coffeType_View = UIView(frame: .zero)
    private let coffe_type = Label(Title: .center, fontSize: 14)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        cellConfig()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func cellConfig() {
        contentView.addSubViews(coffe_name, coffeType_View)
        coffeType_View.translatesAutoresizingMaskIntoConstraints = false
        coffe_name.text = "Latte Coffe"
        coffeType_View.backgroundColor = UIColor(hex: "00adf1")
        coffeType_View.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            coffe_name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            coffe_name.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: -130),
            coffe_name.heightAnchor.constraint(equalToConstant: 24),
            
            coffeType_View.topAnchor.constraint(equalTo: coffe_name.topAnchor),
            coffeType_View.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            coffeType_View.leadingAnchor.constraint(greaterThanOrEqualToSystemSpacingAfter: coffe_name.trailingAnchor, multiplier: 1),
            coffeType_View.heightAnchor.constraint(equalToConstant: 30),
            coffeType_View.widthAnchor.constraint(equalToConstant: 70),
        ])
        
    }
    
    func displayData(){
        coffe_name.text = "Latte Coffe"
        coffeType_View.backgroundColor = UIColor(hex: "3cb34b")
    }
}

struct Coffe {
    let name: String
    let color: String
}
