//
//  SentMemeTableViewCell.swift
//  MeMe
//
//  Created by Justin Owens on 1/2/16.
//  Copyright © 2016 Justin Owens. All rights reserved.
//

import UIKit

class SentMemeTableViewCell: UITableViewCell {

    var meme: Meme?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var memeImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
