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
    
    var superheros: [Superhero] = []
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        
        superheros.append(Superhero(Name: "Spiderman", Alias: "Peter Parker", Power: 100, Picture: UIImage(named: "spiderman")!))
        superheros.append(Superhero(Name: "Batman", Alias: "Bruce Wayne", Power: 100, Picture: UIImage(named: "batman")!))
        superheros.append(Superhero(Name: "Captain America", Alias: "Steve Rogers", Power: 100, Picture: UIImage(named: "Default")!))
        superheros.append(Superhero(Name: "Superman", Alias: "Clark Kent", Power: 100, Picture: UIImage(named: "superman")!))
        superheros.append(Superhero(Name: "Wonder Woman", Alias: "Diana", Power: 100, Picture: UIImage(named: "wonderWoman")!))
        superheros.append(Superhero(Name: "Thor", Alias: "Thor", Power: 100, Picture: UIImage(named: "thor")!))
        
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
            self.superheros.append(Superhero(Name: superheroNameTextField.text!, Alias: aliasNameTextField.text!))
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
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        myTableView.editing = !myTableView.editing
    }
    
    
    //creating a cell that will store data on a tableview.
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myTableViewCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myTableViewCell.textLabel?.text = superheros[indexPath.row].name
        myTableViewCell.detailTextLabel?.text = superheros[indexPath.row].alias
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
            
            myTableView.reloadData()
        }
    }
    
    // allows you to move rows.
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    // changes arrays to move with the row.
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let superhero = superheros[sourceIndexPath.row]
        superheros.removeAtIndex(sourceIndexPath.row)
        superheros.insert(superhero, atIndex: destinationIndexPath.row)
        

    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailVC = segue.destinationViewController as! DetailViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        
        detailVC.superhero = superheros[selectedRow!]
        
    }
    

}

