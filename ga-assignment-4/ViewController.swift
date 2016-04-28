//
//  ViewController.swift
//  ga-assignment-4
//
//  Created by Tommy Susanto on 27/04/2016.
//  Copyright © 2016 Tommy Susanto. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITextFieldDelegate {

    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var tblView: UITableView!
    var result: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.dataSource=self
        txtInput.delegate=self
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        txtInput.resignFirstResponder()
        addNewItem(txtInput.text!)
        txtInput.text=""
        tblView.reloadData()
        return true
    }
    
    
    func addNewItem(input: String){
        result.append(input)
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return nil
    }
    
    func tableView(tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return nil
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return result.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell", forIndexPath: indexPath)
        
        if let cell = cell as? TableViewCell{
            cell.lblText.text = result[indexPath.row]
        }
        return cell
    }


}

