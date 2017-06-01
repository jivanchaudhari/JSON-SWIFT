//
//  Model.swift
//  JSON-Swift
//
//  Created by Mindrose on 30/05/17.
//  Copyright © 2017 Mindrose. All rights reserved.
//

import UIKit

class Actor: NSObject{
    
    
    let nameString : String!
    let countryString: String!
    let imageString: String!
   // static let sharedInstance = Actor(name:nameString,country:countryString,images:imageString)

    init(name:String,country:String,images:String) {
        self.nameString = name
        self.countryString = country
        self.imageString = images
        

    }
    
}
