//
//  SecondViewController.swift
//  ToDo
//
//  Created by Vladimir Saprykin on 24.08.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    var toPass: String!
    var itemsArray = [Data]()
    
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
        textField.inputAccessoryView = accessoryToolbar
        
    }


    @IBAction func addButtonClicked(sender: AnyObject) {
        NSLog("clicked")
        
        toPass = textField.text
        itemsArray.append(Data(title: "\(toPass)"))

        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
}
