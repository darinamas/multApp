//
//  CellForTable.swift
//  multApp
//
//  Created by Daryna Polevyk on 18.09.2021.
//

import UIKit

class CellForTable: UITableViewCell {
    var label: UILabel = {
        let label = UILabel(frame: CGRect(x: 20, y: 20, width: 200, height: 50))
        label.textColor = .green
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   private func addSubview() {
        addSubview(label)
        
    }
}
