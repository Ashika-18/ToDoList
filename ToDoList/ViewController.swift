//
//  ViewController.swift
//  ToDoList
//
//  Created by Kazuhiro Ashiba on 2023/05/13.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var todoList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func addButton(_ sender: Any) {
        
        let alertController = UIAlertController(title: "ToDo追加", message: "ToDoを入力してください。", preferredStyle: UIAlertController.Style.alert)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return todoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "todoCell", for: indexPath)
        
        
        return cell
    }
    
    

}

