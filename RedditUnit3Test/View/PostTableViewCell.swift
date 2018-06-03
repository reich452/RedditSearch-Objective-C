//
//  PostTableViewCell.swift
//  RedditUnit3Test
//
//  Created by Nick Reichard on 5/31/18.
//  Copyright © 2018 Nick Reichard. All rights reserved.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var upsLabel: UILabel!
    
    var post: DVMPost? {
        didSet {
            
            let title = post?.title ?? "No Title"
            let ratingAsInt = post?.commentCount as? Int ?? 0
            let ups = post?.ups as? Int ?? 0
            
            titleLabel.text = title
            commentLabel.text = "Comment's \(ratingAsInt)💬"
            if ups > 1 || ups == 0 {
                upsLabel.text = "Likes \(ups) 💜"
            } else {
                upsLabel.text = "Like \(ups) 💜"
            }
        }
    }
}
