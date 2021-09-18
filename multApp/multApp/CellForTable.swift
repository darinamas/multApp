//
//  CellForTable.swift
//  multApp
//
//  Created by Daryna Polevyk on 18.09.2021.
//

import UIKit

class CellForTable: UITableViewCell {
//    var label: UILabel = {
//        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 50))
//        label.textColor = .green
//        return label
//    }()
    
//    var textField: UITextField = {
//        let textField = UITextField(frame: CGRect(x: 20, y: 5, width: 200, height: 30))
//        textField.text = "Hello"
//        textField.backgroundColor = .blue
//        return textField
//    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    func textFieldDidBeginEditing(textField: UITextField) {
//        print("executed")
//        
//        let textField: UITextField = self.text.textField
//        if (textField.text != detail!.valueForKey("name")!.description + detail!.valueForKey("number")!.description) {
//            detail?.setValue(textField.text, forKey: "name")
//        }
//    }
    
   private func addSubview() {
      //  addSubview(label)
        
    }
}
