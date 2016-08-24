//
//  ViewController.swift
//  ToDo
//
//  Created by Vladimir Saprykin on 24.08.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    
    var toDoList = [Data]()
    var destVC: SecondViewController? = SecondViewController()

    func addTapped() {
        performSegueWithIdentifier("showDetail", sender: self)
        
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        destVC = segue.destinationViewController  as? SecondViewController
        
        destVC?.itemsArray = toDoList
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        toDoList = (destVC?.itemsArray)!
        tableView.reloadData()
        destVC = nil
    }
    
    override func viewDidLoad() {
        title = "ToDo LIST"
        
        //toDoList.append(Data(title: "5tf5f5tf5tf"))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .Plain, target: self, action: #selector(addTapped))
       
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! ToDoCell
        
        let toDo = toDoList[indexPath.row]
        
        cell.toDoTextLabel.text = toDo.title
        
        
        
        return cell
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            toDoList.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    


}

