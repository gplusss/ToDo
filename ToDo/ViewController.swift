//
//  ViewController.swift
//  ToDo
//
//  Created by Vladimir Saprykin on 24.08.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit
import RealmSwift


class ViewController: UITableViewController {

    var toDoList = Set<Data>()
    var destVC: SecondViewController? = SecondViewController()
    
    func addTapped() {
        performSegueWithIdentifier("showDetail", sender: nil)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        guard let secondViewController = segue.destinationViewController as? SecondViewController else { return }
        secondViewController.delegate = self
        
        if let todo = sender as? Data { //edit
            secondViewController.todo = todo
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        title = "TODO LIST"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "ADD", style: .Plain, target: self, action: #selector(addTapped))
       
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ToDoCell
        
        let toDo = toDoList[toDoList.startIndex.advancedBy(indexPath.row)]
        
        cell.toDoTextLabel.text = toDo.title
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let todo = toDoList[toDoList.startIndex.advancedBy(indexPath.row)]
        performSegueWithIdentifier("showDetail", sender: todo)

    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            toDoList.removeAtIndex(toDoList.startIndex.advancedBy(indexPath.row))
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
}

extension ViewController: SecondViewControllerDelegate {
    func didSaveTodo(todo: Data) {
        toDoList.insert(todo)
    }
}

