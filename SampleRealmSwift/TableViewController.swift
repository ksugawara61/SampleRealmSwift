//
//  ViewController.swift
//  SampleRealmSwift
//
//  Created by 菅原勝也 on 2017/09/25.
//  Copyright © 2017年 instil. All rights reserved.
//

import UIKit
import RealmSwift

class TableViewController: UITableViewController {
    
    var todoItem: Results<Todo>!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 永続化されているデータを取りだす
        do{
            let realm = try Realm()
            todoItem = realm.objects(Todo.self)
            tableView.reloadData()
        }catch{
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // 1. TableViewに表示するデータの個数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItem.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        // todoItemに代入されたデータをobject:NSArrayに代入
        let object = todoItem[indexPath.row]
        
        //cellのtextLabelのtextにobjectのtitleプロパティを代入
        cell.textLabel?.text = object.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.delete) {
            do{
                let realm = try Realm()
                try realm.write {
                    realm.delete(self.todoItem[indexPath.row])
                }
                tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
            }catch{
            }
            tableView.reloadData()
        }
    }
}

