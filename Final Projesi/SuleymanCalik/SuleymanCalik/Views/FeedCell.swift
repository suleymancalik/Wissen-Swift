//
//  FeedCell.swift
//  SuleymanCalik
//
//  Created by Suleyman Calik on 11/01/15.
//  Copyright (c) 2015 Wissen. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {

    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var imgPhoto: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    @IBOutlet weak var lblLikeCount: UILabel!
    @IBOutlet weak var btnLike: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    

}
