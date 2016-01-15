//
//  ViewController.swift
//  Table View Practice
//
//  Created by HChlebek on 1/13/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit
// add data source and tableview protocalls.
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{

    @IBOutlet weak var myTableView: UITableView!
    
    var superheros = ["Batman", "Wonder Woman", "Superman", "Flash", "Aquaman", "Scuba Steve"]
    var realNames = ["Bruce Wayne", "Diana", "Clark Kent", "Barry Allen", "Arthur Curry", "Steve"]
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        // setting the data source and delegate to the viewcontroller.
    }

    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add Superhero", message: nil, preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let superheroNameTextField = myAlert.textFields![0] as UITextField
            let aliasNameTextField = myAlert.textFields! [1] as UITextField
            self.superheros.append(superheroNameTextField.text!)
            self.realNames.append(aliasNameTextField.text!)
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        myAlert.addTextFieldWithConfigurationHandler { (superheroTextField) -> Void in
            superheroTextField.placeholder = "Add a superhero name"
        }
        myAlert.addTextFieldWithConfigurationHandler { (aliasTextField) -> Void in
            aliasTextField.placeholder = "Add a real name"
        }
        
        // presents alertview
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    //creating a cell that will store datat on a tableview.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myTableViewCell.textLabel?.text = superheros[indexPath.row]
        myTableViewCell.detailTextLabel?.text = realNames[indexPath.row]
        return myTableViewCell
    }
    // sets number of rows in your tableviews.
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return superheros.count
    }
    
    //allows you to delete rows from table view.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            superheros.removeAtIndex(indexPath.row)
            realNames.removeAtIndex(indexPath.row)
            
            myTableView.reloadData()
        }
    }


}

