//
//  FeedVC.swift
//  SuleymanCalik
//
//  Created by Suleyman Calik on 21/12/14.
//  Copyright (c) 2014 Wissen. All rights reserved.
//

import UIKit
import Parse

class FeedVC: UIViewController, UITableViewDataSource , UITableViewDelegate {

    
    @IBOutlet weak var tableView: UITableView!
    var posts = [PFObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        fetchPosts()
    }
    
    
    // MARK: - Utility Methods
    
    
    func fetchPosts() {
        
        var query = PFQuery(className:classPost)
        query.orderByDescending("createdAt")
        query.includeKey("user")
        query.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            if error == nil {
                self.posts = objects as [PFObject]
                self.tableView.reloadData()
            }
            else {
                println("Basarisiz : \(error)")
            }
        }
        
    }


    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ProfileSegue" {
            var profileVC = segue.destinationViewController as ProfileVC
            profileVC.user = sender as PFUser
        }
        
    }
    
    
    // MARK: - Action Methods
    
    @IBAction func btnLikeTapped(sender: UIButton) {
        
        sender.enabled = false
        
        var index = sender.tag
        var post = posts[index]
        
        var cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow:index,inSection:0)) as FeedCell
        
        if sender.selected {
            // begeniyi sil
            
            var query = PFQuery(className: classLike)
            query.whereKey("user", equalTo: PFUser.currentUser())
            query.whereKey("post", equalTo: post)
            query.getFirstObjectInBackgroundWithBlock({ (object, error) -> Void in
                if let like:PFObject = object {
                    like.deleteEventually()
                    
                    var likeCount = cell.lblLikeCount.tag
                    cell.lblLikeCount.tag = --likeCount
                    cell.lblLikeCount.text = "\(likeCount) Beğeni"
                    sender.setTitle("Beğen", forState: UIControlState.Normal)
                    sender.selected = false
                    sender.enabled = true
                }
            })
        }
        else {
            // begeni olustur
            
            var like = PFObject(className: classLike)
            like["user"] = PFUser.currentUser()
            like["post"] = post
            like.saveInBackgroundWithBlock({ (saved, error) -> Void in
                if saved {
                    var likesRelation = post.relationForKey("likes")
                    likesRelation.addObject(like)
                    post.saveEventually()
                    
                    sender.setTitle("Beğendin", forState: UIControlState.Normal)
                    var likeCount = cell.lblLikeCount.tag
                    cell.lblLikeCount.tag = ++likeCount
                    cell.lblLikeCount.text = "\(likeCount) Beğeni"

                }
                
                sender.selected = true
                sender.enabled = true
                
            })
            
        }
        
    }
    
    
    
    // MARK: - TableView Methods
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCellWithIdentifier("FeedCell") as FeedCell
        
        var post = posts[indexPath.row]
        var user = post["user"] as PFUser
        
        
        var firstName = user["firstName"] as String
        var lastName = user["lastName"] as String
        
        var username =  firstName + " " + lastName

        var description = post["description"] as String
        
        
        cell.lblUsername.text = username
        cell.lblDescription.text = description

        cell.imgPhoto.image = nil
        if let photoFile = post["photo"] as? PFFile {
            photoFile.getDataInBackgroundWithBlock({ (imageData, error) -> Void in
                if let imageData = imageData {
                    cell.imgPhoto.image = UIImage(data:imageData)
                }
            })
        }
        

        cell.btnLike.hidden = true
        cell.lblLikeCount.text = ""

        if let likesRelation = post.relationForKey("likes") {
            
            
            var query = likesRelation.query()
            query.findObjectsInBackgroundWithBlock({ (likes, error) -> Void in
                if let likes = likes {
                    cell.lblLikeCount.text = "\(likes.count) Beğeni"
                    cell.lblLikeCount.tag = likes.count
                    
                    var isLiked = false
                    for like in likes {
                        if let user = like["user"] as? PFUser {
                            if user.objectId == PFUser.currentUser().objectId {
                                isLiked = true
                                break
                            }
                        }
                    }
                    
                    if isLiked {
                        cell.btnLike.selected = true
                        cell.btnLike.setTitle("Beğendin", forState: UIControlState.Normal)
                    }
                    else {
                        cell.btnLike.selected = false
                        cell.btnLike.setTitle("Beğen", forState: UIControlState.Normal)
                    }
                    
                    cell.btnLike.tag = indexPath.row
                    cell.btnLike.hidden = false
                    
                }
            })
            

        }
        
        
        
        return cell
    }
    

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var user = posts[indexPath.row]["user"] as PFUser
        performSegueWithIdentifier("ProfileSegue", sender:user)
    }

}












