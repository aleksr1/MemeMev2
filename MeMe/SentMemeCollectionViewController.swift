//
//  SentMemeCollectionViewController.swift
//  MeMe
//
//  Created by Justin Owens on 1/2/16.
//  Copyright © 2016 Justin Owens. All rights reserved.
//

import UIKit


class SentMemeCollectionViewController: UICollectionViewController {

    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
    var memes = [Meme]()
    var applicationDelegate: AppDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        applicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        configFlowLayout()
        refresh()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        collectionView?.reloadData()
        refresh()
    }

    func configFlowLayout() {
        let space: CGFloat = 3.0
        let dimension = (view.frame.size.width - (2 * space)) / 3.0
        
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSizeMake(dimension, dimension)
    }
    
    func refresh() {
        memes = applicationDelegate.memes
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "collectionToDetailSegue" {
            if let indexPaths = collectionView?.indexPathsForSelectedItems(){
                let indexPath = indexPaths[0]
                if let dc = segue.destinationViewController as? MemeDetailViewController {
                    dc.image = memes[indexPath.item].memedImage

                }
            }
        }
    }


    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return memes.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! SentMemeCollectionViewCell
        let meme = memes[indexPath.item]
        cell.memeImage.image = meme.memedImage
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("collectionToDetailSegue", sender: self)
    }

    
}
