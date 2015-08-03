//
//  ProfileViewController.swift
//  trakfire
//
//  Created by Arjun Mehta on 7/21/15.
//  Copyright (c) 2015 Arjun Mehta. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let meteor = (UIApplication.sharedApplication().delegate as! AppDelegate).meteorClient
    

    @IBOutlet weak var usernameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        if let user = meteor.collections["users"] as? M13OrderedDictionary{
            usernameLabel!.text = (user.objectAtIndex(0)["username"] as! String)
            println(user.objectAtIndex(0)["slug"])
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
