//
//  DisplayViewController.swift
//  JSON-Swift
//
//  Created by Mindrose on 31/05/17.
//  Copyright © 2017 Mindrose. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {

    var displayActor:String!
    var actorCountry:String!
    var actorImage:String!
    

    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var actorImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      
        nameLabel.text = displayActor
        countryLabel.text = actorCountry
        let imageURL = NSURL(string: actorImage )
        
        let data = NSData(contentsOf: imageURL! as URL)
        actorImageView.image = UIImage(data: data! as Data)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
