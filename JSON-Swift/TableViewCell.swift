//
//  TableViewCell.swift
//  JSON-Swift
//
//  Created by Mindrose on 29/05/17.
//  Copyright © 2017 Mindrose. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var imageViewActors: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var countryLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
