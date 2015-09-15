//
//  PhotoDetailsViewController.swift
//  InstagramFeed
//
//  Created by Pankaj Manghnani on 9/11/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

   
    @IBOutlet weak var image: UIImageView!
    @IBOutlet var fullName: UILabel!
    var photo:AnyObject!
    override func viewDidLoad() {
      
        super.viewDidLoad()
        let imageUrl=NSURL(string:photo.valueForKeyPath("images.low_resolution.url") as! String)
        image.setImageWithURL(imageUrl!)
        // Do any additional setup after loading the view.
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
