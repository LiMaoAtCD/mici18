//
//  MainPageFirstItemCell.swift
//  mici18
//
//  Created by AlienLi on 14/12/31.
//  Copyright (c) 2014年 ALN. All rights reserved.
//

import UIKit

class MainPageFirstItemCell: UITableViewCell {

    @IBOutlet weak var firstItemImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        firstItemImageView.setNeedsLayout()
        println( firstItemImageView.bounds.height)
        firstItemImageView.layer.cornerRadius = firstItemImageView.bounds.height > firstItemImageView.bounds.width ? (firstItemImageView.bounds.width / 2 - 1)  : (firstItemImageView.bounds.height / 2 - 1)
        firstItemImageView.layer.masksToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
