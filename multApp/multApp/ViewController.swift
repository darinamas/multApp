//
//  ViewController.swift
//  multApp
//
//  Created by Daryna Polevyk on 18.09.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var data2 = ["2" : ["2^1 = 2", "2^2 = 4", "2^3 = 8"]]
    var data3 = ["3" : ["3^1 = 3", "3^2 = 9", "3^3 = 27"], "2" : ["2^1 = 2", "2^2 = 4", "2^3 = 8"]]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CellForTable.self, forCellReuseIdentifier: "cell")
        
        let a = data3["3"]
        print(a![0])
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
        
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CellForTable
        cell.backgroundColor = .blue
      //  cell.label.text = "Section: \(indexPath.section) Row: \(indexPath.row)"
        
        if indexPath.section == 0 {
            cell.label.text = "Hello 0"
        } else {
            let a = data3["3"]
            print(a![indexPath.row])
            cell.label.text = a![indexPath.row]
        }
        
        return cell
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



