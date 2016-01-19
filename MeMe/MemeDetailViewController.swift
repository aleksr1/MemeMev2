//
//  MemeDetailViewController.swift
//  MeMe
//
//  Created by Justin Owens on 1/2/16.
//  Copyright © 2016 Justin Owens. All rights reserved.
//

import UIKit

class MemeDetailViewController: UIViewController {

    var image: UIImage?
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let memeImage = image {
            imageView.image = memeImage
        }
    }
}
