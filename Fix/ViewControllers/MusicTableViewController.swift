//
//  MusicTableViewController.swift
//  trakfire
//
//  Created by Arjun Mehta on 7/17/15.
//  Copyright (c) 2015 Arjun Mehta. All rights reserved.
//

import UIKit

class MusicTableViewController: UITableViewController {
    
    private let meteor = (UIApplication.sharedApplication().delegate as! AppDelegate).meteorClient
    
    var posts: M13OrderedDictionary!

    var userInfoList:[User]!
    
    @IBAction func upvote(sender: UIButton) {
      
    }
    
        
    @IBAction func signIn(sender: AnyObject) {
        signIn()
    }
    
    
    func signIn(){
        if !meteor.websocketReady {
            let notConnectedAlert = UIAlertView(title: "Connection Error", message: "Can't find the server, try again", delegate: nil, cancelButtonTitle: "OK")
            notConnectedAlert.show()
            return
        }
        
        meteor.logonWithEmail("arjunkme@usc.edu", password: "griffin1") {(response, error) -> Void in
            
            if error != nil {
                println("error")
                return
            }
            else {
                println("login successful")
            }

        }
        
        
    }
    
    @IBAction func button(sender: AnyObject) {
         posts = meteor.collections["posts"] as? M13OrderedDictionary
        if let user = meteor.collections["users"] as? M13OrderedDictionary{
            //println(user.description)
            //println(user.objectAtIndex(0)["slug"])
        }

        if let posts = meteor.collections["posts"] as? M13OrderedDictionary{
            println(posts.description)
//            println(posts.objectAtIndex(0)["title"])
//            println(posts.objectAtIndex(1)["title"])
//            println(posts.objectAtIndex(2)["title"])
//            println(posts.objectAtIndex(3)["title"])
        
        }
        
        tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        posts = meteor.collections["posts"] as? M13OrderedDictionary

        //meteor.addSubscription("posts")
      
        //self.tableView.registerClass(TrackCell.self, forCellReuseIdentifier: "TrackCell")
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func viewWillAppear(animated: Bool) {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didReceiveUpdate:", name: "posts_added", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didReceiveUpdate:", name: "posts_removed", object: nil)

    }
    
    func didReceiveUpdate(notification:NSNotification) {
        println("did receive update")
        tableView.reloadData()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        if let posts1 = posts{
            return Int(posts1.count())
        }
        
        return 0
        
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("TrackCell", forIndexPath: indexPath) as! TrackCell

        // Configure the cell...
        
        if let posts = posts{
            
            if let postsCheck2 = posts.objectAtIndex(UInt(indexPath.row))["title"] as? String {
            cell.songTitle.text = postsCheck2
            }
            
            if let postsCheck3 = posts.objectAtIndex(UInt(indexPath.row))["upvotes"] as? NSInteger {
                cell.upvoteCount.text = "\(postsCheck3)"
            }
            
        }
        //cell.loadAddressURL()
        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
