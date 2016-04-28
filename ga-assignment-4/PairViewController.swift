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
    
    var result: [String] = []
    
    @IBOutlet weak var txtPair1: UITextField!
    @IBOutlet weak var txtPair2: UITextField!
    @IBOutlet weak var tblView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtPair1.delegate=self
        txtPair2.delegate=self
        tblView.dataSource=self

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        if let pair1 = txtPair1.text, pair2 = txtPair2.text{
            addNewItem("\(pair1) - \(pair2)")
        }
        tblView.reloadData()
        return true
    }
    
    func addNewItem(input: String){
        result.append(input)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return result.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("tableCell2", forIndexPath: indexPath)
        
        if let cell = cell as? TableViewCell2{
            cell.lblPairs.text=result[indexPath.row]
        }
        
        return cell
    }

    
    
}