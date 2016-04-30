//
//  ViewController.swift
//  ga-assignment-4
//
//  Created by Tommy Susanto on 27/04/2016.
//  Copyright © 2016 Tommy Susanto. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UITextFieldDelegate {

    @IBOutlet weak var txtInput: UITextField!
    @IBOutlet weak var tblView: UITableView!
    var result: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.dataSource=self
        txtInput.delegate=self
        formatBar()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // This function is called when "return" button is pressed
    func textFieldShouldReturn(textField: UITextField) -> Bool{
        txtInput.resignFirstResponder()
        addNewItem(txtInput.text!)
        txtInput.text=""
        tblView.reloadData()
        return true
    }
    
    // This adds new item into the array
    func addNewItem(input: String){
        if input != "" {
            result.append(input)
        }
        else {
            let alert = UIAlertController(title: "Warning", message: "You cannot leave textfield blank", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    func tableView(tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    //These functions populate data into cells
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
    
    //These functions delete selected row (Swipe left)
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            result.removeAtIndex(indexPath.row)
            tblView.reloadData()
        }
    }
    
    //Formatting Navigation Bar
    func formatBar(){
        //Navigation Controller Color setup
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255/255, green: 41/255, blue: 67/255, alpha: 1)
        self.navigationController?.navigationBar.tintColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.init(red: 255/255, green: 255/255, blue: 255.255, alpha: 1)]
    }


}

