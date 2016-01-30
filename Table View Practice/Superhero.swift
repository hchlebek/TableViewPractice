//
//  Superhero.swift
//  Table View Practice
//
//  Created by HChlebek on 1/15/16.
//  Copyright © 2016 HChlebek. All rights reserved.
//

import UIKit

class Superhero: NSObject
{

    var name = ""
    var alias = ""
    var power = 0
    var picture = UIImage(named: "Default")
    
    init(Name: String, Alias: String, Power: Int, Picture: UIImage)
    {
        super.init()
        name = Name
        alias = Alias
        power = Power
        picture = Picture
    }
    
    init(Name: String, Alias: String)
    {
        super.init()
        name = Name
        alias = Alias
    }
}
