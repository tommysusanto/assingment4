//
//  PairViewController.swift
//  ga-assignment-4
//
//  Created by Tommy Susanto on 28/04/2016.
//  Copyright © 2016 Tommy Susanto. All rights reserved.
//

import Foundation
import UIKit

class PairViewController: UIViewController,UITableViewDataSource,UITextFieldDelegate{
    
    var myDictionary: [String: String] = [String: String]()
    
    @IBOutlet weak var txtPair1: UITextField!
    @IBOutlet weak var txtPair2: UITextField!
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtPair1.delegate=self
        txtPair2.delegate=self
        tblView.dataSource=self
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(PairViewController.keyboardWillAppear), name: UIKeyboardWillShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(PairViewController.keyboardWillHide), name: UIKeyboardWillHideNotification, object: nil)
        

    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        if txtPair1.text! != "" && txtPair2.text! != "" {
            addDictionary(txtPair1.text!, value: txtPair2.text!)
            txtPair1.text=""
            txtPair2.text=""
        }
        else{
            let alert = UIAlertController(title: "Warning", message: "Please fill out both Key and Value field", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        tblView.reloadData()
        return true
    }
    
    func addDictionary(key: String,value: String){
        myDictionary[key]=value
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return myDictionary.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell2", forIndexPath: indexPath)
        
        if let cell = cell as? TableViewCell2{
            
            // This method extracts all values in the Dictionary and put it into a temporary array
            var tempArray: [String] = []
            for (key, value) in myDictionary {
                tempArray.append("\(key) - \(value)")
            }
            cell.lblPairs.text=tempArray[indexPath.row]
        }
        return cell
    }
    
    
    
    func keyboardWillAppear() {
        txtPair1.backgroundColor=UIColor.blueColor()
        txtPair2.backgroundColor=UIColor.blueColor()
        txtPair1.textColor=UIColor.whiteColor()
        txtPair2.textColor=UIColor.whiteColor()
    }
    
    func keyboardWillHide() {
        txtPair1.backgroundColor=UIColor.redColor()
        txtPair2.backgroundColor=UIColor.redColor()
        txtPair1.textColor=UIColor.whiteColor()
        txtPair2.textColor=UIColor.whiteColor()
    }

    
    
}