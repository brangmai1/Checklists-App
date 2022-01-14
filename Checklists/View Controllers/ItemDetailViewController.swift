//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Brang Mai on 12/26/21.
//

import UIKit

protocol ItemDetailViewControllerDelegate: AnyObject {
    func itemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishAdding item: ChecklistItem)
    
    func itemDetailViewController(_ controller: ItemDetailViewController, didFinishEditing item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var textField: UITextField!    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    weak var delegate: ItemDetailViewControllerDelegate?    
    var itemToEdit: ChecklistItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customizes the Navigation Item for the Add Item screen to never show large titles
        // navigationItem.largeTitleDisplayMode = .never
        
        if let item = itemToEdit {
            // The above line can also be written as if let itemToEdit = itemToEdit.
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }

    }
    
    //MARK： - Actions
    @IBAction func cancel() {
        // navigationController?.popViewController(animated: true)
        
        delegate?.itemDetailViewControllerDidCancel(self)
    }

    @IBAction func done() {
//        print("Contents fo the text field: \(textField.text!)")
//        navigationController?.popViewController(animated: true)
        
        if let item = itemToEdit {
            item.text = textField.text!
            delegate?.itemDetailViewController(self, didFinishEditing: item)
        } else {
            let item = ChecklistItem()
            item.text = textField.text!            
            delegate?.itemDetailViewController(self, didFinishAdding: item)
        }
    }
    
    // MARK: - Table View Delegates
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    // This function present keyboard automatically
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    //MARK: -Text Field Delegates
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in: oldText)!
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        
//        if newText.isEmpty {
//            doneBarButton.isEnabled = false
//        } else {
//            doneBarButton.isEnabled = true
//        }
        
        doneBarButton.isEnabled = !newText.isEmpty // Shortened code
        return true
    }
    
    // Add Clear Button while the input text is being edited by the user
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        doneBarButton.isEnabled = false
        return true
    }
}
