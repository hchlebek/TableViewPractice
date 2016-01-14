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
    


}

