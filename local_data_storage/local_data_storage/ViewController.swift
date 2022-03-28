//
//  ViewController.swift
//  local_data_storage
//
//  Created by MacBook on 28.03.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTaskTextField: UITextField!
    
    @IBOutlet weak var myStatus: UILabel!
    
    @IBOutlet weak var myTable: UITableView!
    
    var toDoArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let data = UserDefaults.standard.object(forKey: "todolist") as? [String] {
            
            toDoArray = data
            myStatus.text = "\(toDoArray.count) Task Pending in To Do List"
            
        }else {
            myStatus.text = "No Task Pending"
        }
    }
    @IBAction func saveButton(_ sender: UIButton) {
        if myTaskTextField.text != "" {
            toDoArray.append(myTaskTextField.text!)
            UserDefaults.standard.set(toDoArray, forKey: "todolist")
            myTable.reloadData()
            myStatus.text = "New Task Added in To Do List"
            myTaskTextField.text = ""
            
        }else {
            myStatus.text = "Kindly enter task first."
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = myTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = toDoArray[indexPath.row]
        return cell
        
    }
    
}
