//
//  PhotoCell.swift
//  InstagramFeed
//
//  Created by Pankaj Manghnani on 9/11/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class PhotoCell: UITableViewCell {

    @IBOutlet weak var profileImage: PhotoImage!
    @IBOutlet weak var photoImage: PhotoImage!
   
    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var photoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
