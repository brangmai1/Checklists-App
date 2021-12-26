//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Brang Mai on 12/26/21.
//

import UIKit

class AddItemViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customizes the Navigation Item for the Add Item screen to never show large titles
        // navigationItem.largeTitleDisplayMode = .never

    }
    
    //MARK： - Actions
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }
}
