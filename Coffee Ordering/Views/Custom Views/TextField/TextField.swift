//
//  TextField.swift
//  Coffee Ordering
//
//  Created by Abdirizak Hassan on 2/1/23.
//

import Foundation
import UIKit

final class TextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func config(){
        translatesAutoresizingMaskIntoConstraints = false
        
        textContentType = .username
        
        layer.cornerRadius = 5
        
        textColor           = .label
        tintColor           = .label
        
        textAlignment       = .left
        font                = UIFont.systemFont(ofSize: 17)
        minimumFontSize     = 16
        
        backgroundColor     = .clear
        autocorrectionType  = .no
        returnKeyType       = .next
        clearButtonMode     = .whileEditing
        placeholder         = "Enter Username"
    }
}
