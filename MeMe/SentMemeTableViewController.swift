//
//  SentMemeTableViewController.swift
//  MeMe
//
//  Created by Justin Owens on 1/2/16.
//  Copyright © 2016 Justin Owens. All rights reserved.
//

import UIKit


class SentMemeTableViewController: UITableViewController {

    var memes = [Meme]()
    var applicationDelegate: AppDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        applicationDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate)
        refresh()
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        refresh()
        tableView.reloadData()
        
    }

    func refresh() {
        memes = applicationDelegate.memes
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! SentMemeTableViewCell 

        let meme = memes[indexPath.row]
        cell.label.text = meme.top
        cell.memeImage.image = meme.memedImage

        return cell
    }

    override func tableView(tableView: UITableView, didDeselectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("tableToDetailSegue", sender: self)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "tableToDetailSegue"{
            if let dc = segue.destinationViewController as? MemeDetailViewController{
                if let index = tableView.indexPathForSelectedRow?.row {
                    dc.image = memes[index].memedImage
                }
            }
        }
    }

}
