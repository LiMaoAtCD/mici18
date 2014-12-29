//
//  LeftSideCell.swift
//  mici18
//
//  Created by AlienLi on 14/12/29.
//  Copyright (c) 2014年 ALN. All rights reserved.
//

import UIKit

class LeftSideCell: UITableViewCell {

    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var leftLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.backgroundColor = UIColor.clearColor()
    }
    
}
