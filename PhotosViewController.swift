//
//  PhotosViewController.swift
//  InstagramFeed
//
//  Created by Pankaj Manghnani on 9/10/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class PhotosViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var photosTableView: PhotoTable!
    
   
    var photos: NSArray!
    override func viewDidLoad() {
        super.viewDidLoad()

        let clientId = "d6f7fbf0335e46abbed58adf4a11e321"
        
        let url = NSURL(string: "https://api.instagram.com/v1/media/popular?client_id=\(clientId)")!
        let request = NSURLRequest(URL: url)
        
        NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) { (response, data, error) -> Void in
            let responseDictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: []) as! NSDictionary
            self.photos = responseDictionary["data"] as! NSArray
            self.photosTableView.dataSource = self
            self.photosTableView.delegate = self
            self.photosTableView.rowHeight=160
           
           
            NSLog("response: \(self.photos)")
             //self.photosTableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("com.codepath.photocell", forIndexPath: indexPath) as! PhotoCell
        let photo = photos[indexPath.row]
        let imageUrl=NSURL(string:photo.valueForKeyPath("images.thumbnail.url") as! String)
        cell.photoImage.setImageWithURL(imageUrl!)
        
        let profileUrl=NSURL(string:photo.valueForKeyPath("user.profile_picture") as! String)
        cell.profileImage.setImageWithURL(profileUrl!)
        cell.name.text=photo.valueForKeyPath("user.full_name") as! String
        cell.caption.text=photo.valueForKeyPath("caption.text") as! String
       
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let cell=sender as! PhotoCell
        let indexPath=photosTableView.indexPathForCell(cell)!
        let photo=photos![indexPath.row]
        let photoDetailViewController=segue.destinationViewController as! PhotoDetailsViewController
        photoDetailViewController.photo=photo
    }
    

}
