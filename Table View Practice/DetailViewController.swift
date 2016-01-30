//
//  DetailViewController.swift
//  Table View Practice
//
//  Created by HChlebek on 1/19/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var aliasTextfield: UITextField!
    @IBOutlet weak var powerTextfield: UITextField!
    var superhero: Superhero!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameTextfield.text = superhero.name  // passes data into textfield.
        aliasTextfield.text = superhero.alias
        powerTextfield.text = String(superhero.power)
        myImageView.image = superhero.picture
    }
    @IBAction func saveButtonTapped(sender: UIButton)
    {
        superhero.name = nameTextfield.text!
        superhero.alias = nameTextfield.text!
        superhero.power = Int(powerTextfield.text!)!
    }
}
