//
//  Data.swift
//  ToDo
//
//  Created by Vladimir Saprykin on 24.08.16.
//  Copyright © 2016 Vladimir Saprykin. All rights reserved.
//

import Foundation
import RealmSwift

class Data: Object {
    dynamic var title: String = ""
    
     convenience init(title: String) {
        self.init()
        self.title = title
    }
    
}