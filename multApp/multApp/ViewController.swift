//
//  ViewController.swift
//  multApp
//
//  Created by Daryna Polevyk on 18.09.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    // var data = ["2" : ["2^1 = 2", "2^2 = 4", "2^3 = 8"], "3" : ["3^1 = 3", "3^2 = 9", "3^3 = 27"], "4" : ["3^1 = 3", "3^2 = 9", "3^3 = 27"]]
    var number: Int = 0
    var textField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CellForTable.self, forCellReuseIdentifier: "cell")
        
    }
    
    func updateNumber() {
        guard let text = textField?.text, let number = Int(text) else { return }
        self.number = number
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellForTable
            cell.selectionStyle = .none
            
            if let textField = cell.viewWithTag(2) as? UITextField {
                textField.text = ""
            } else {
                textField?.tag = 2
                textField = UITextField(frame: CGRect(x: 20, y: 5, width: 200, height: 30))
                textField!.delegate = self
                cell.contentView.addSubview(textField!)
                textField!.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellForTable
            cell.selectionStyle = .none
            let a = NSDecimalNumber(decimal: pow(Decimal(number), indexPath.row)).intValue
            if let label = cell.viewWithTag(1) as? UILabel {
            label.text = "\(number) ^ \(indexPath.row) = \(a)"
            } else {
                let label: UILabel = {
                    let label = UILabel(frame: CGRect(x: 20, y: 5, width: 200, height: 30))
                    label.textColor = .black
                    label.tag = 1
                    return label
                }()
                cell.addSubview(label)
            }
            
            return cell
        }
        
    }
    
    @objc func textFieldDidChange() {
        updateNumber()
        tableView.reloadData()
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view = UIView()
        let label = UILabel()
        label.text = section == 0 ?  " " : "Cтепени"
        label.backgroundColor = UIColor.lightGray
        label.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 30)
        view.addSubview(label)
        
        return view
        
    }
    
}



