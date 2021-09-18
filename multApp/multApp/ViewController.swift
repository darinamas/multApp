//
//  ViewController.swift
//  multApp
//
//  Created by Daryna Polevyk on 18.09.2021.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    var data = ["2" : ["2^1 = 2", "2^2 = 4", "2^3 = 8"], "3" : ["3^1 = 3", "3^2 = 9", "3^3 = 27"]]
    var textInTexField: String?
    var textField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(CellForTable.self, forCellReuseIdentifier: "cell")
        
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellForTable
            cell.selectionStyle = .none
        
            textField = UITextField(frame: CGRect(x: 20, y: 5, width: 200, height: 30))
            textField!.delegate = self
            cell.contentView.addSubview(textField!)
            textField!.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellForTable
            cell.selectionStyle = .none
            var label: UILabel = {
                let label = UILabel(frame: CGRect(x: 20, y: 5, width: 200, height: 30))
                label.textColor = .green
                return label
            }()
            cell.addSubview(label)
            
            if textInTexField == "3" {
                let a = data["3"]
                print(a![indexPath.row])
                label.text = a![indexPath.row]
            } else {
                label.text = " "
            }
            print(textInTexField)
            
            return cell
        }
        
    }
    
    @objc func butAction() {
        tableView.reloadData()
    }
    
    @objc func textFieldDidChange() {
        textInTexField = textField?.text
        tableView.reloadData()
        print(textInTexField)
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



