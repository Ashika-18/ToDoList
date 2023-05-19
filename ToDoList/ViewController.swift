//
//  ViewController.swift
//  ToDoList
//
//  Created by Kazuhiro Ashiba on 2023/05/13.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var todoList = [String]()
    
    let userDefaults = UserDefaults.standard
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let storedTodoList = userDefaults.array(forKey: "todoList") as? [String] {
            
            todoList.append(contentsOf: storedTodoList)
        }
    }

    @IBAction func addButton(_ sender: Any) {
        
        let alertController = UIAlertController(title: "ToDo追加", message: "ToDoを入力してください。", preferredStyle: UIAlertController.Style.alert)
        
        alertController.addTextField(configurationHandler: nil)
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (acrion: UIAlertAction) in
            
            if let textField = alertController.textFields?.first {
                
                self.todoList.insert(textField.text!, at: 0)
                
                self.tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: UITableView.RowAnimation.right)
                
                self.userDefaults.set(self.todoList, forKey: "todoList")
            }
        }
        
        alertController.addAction(okAction)
        
        let cancelButton = UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.cancel, handler: nil)
        
        alertController.addAction(cancelButton)
        
        present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        let todoTitle = todoList[indexPath.row]
        
        cell.textLabel?.text = todoTitle
        
        //cell.accessoryType = .checkmark
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete {
            
            todoList.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
            
            userDefaults.set(todoList, forKey: "todoList")
        }
    }
    

}

