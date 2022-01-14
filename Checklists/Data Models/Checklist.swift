//
//  Checklist.swift
//  Checklists
//
//  Created by Brang Mai on 1/9/22.
//

import UIKit

class Checklist: NSObject, Codable {
    var name = ""
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }

}
