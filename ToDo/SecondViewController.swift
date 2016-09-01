//
//  SecondViewController.swift
//  ToDo
//
//  Created by Vladimir Saprykin on 24.08.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit
import RealmSwift


protocol SecondViewControllerDelegate: class {
    func didSaveTodo(todo: Data)
}

class SecondViewController: UIViewController, UITextFieldDelegate {
    
    var todo: Data?
    weak var delegate: SecondViewControllerDelegate?
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var addButton: UIButton!
    
    
    lazy var accessoryToolbar: UIToolbar = {
        let toolbar = UIToolbar(frame: CGRectMake(0, 0, self.view.frame.size.width, 50))
        toolbar.barStyle = UIBarStyle.Default
        toolbar.items = [
            UIBarButtonItem(title: "Cancel", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(SecondViewController.cancelDidPressed)),
            UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: nil, action: nil),
            UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(SecondViewController.doneDidPressed))]
        toolbar.sizeToFit()
        return toolbar
    }()
    
    func cancelDidPressed() {
        view.endEditing(true)
    }
    
    func doneDidPressed() {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if todo?.title != nil {
            addButton.setTitle("EDIT", forState: .Normal)
            
        }
        textField.text = todo?.title
        textField.inputAccessoryView = accessoryToolbar
        
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
    }


    @IBAction func addButtonClicked(sender: AnyObject) {
        NSLog("clicked")
        
        let title = textField.text ?? ""
        
        if todo?.title == nil {
            todo = Data(title: title)
        } else {
            todo?.title = title
        }
        
        delegate?.didSaveTodo(todo!)
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
