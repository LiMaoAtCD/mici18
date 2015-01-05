//
//  MainPageForSixTableViewCell.swift
//  mici18
//
//  Created by AlienLi on 15/1/4.
//  Copyright (c) 2015年 ALN. All rights reserved.
//

import UIKit

class MainPageForSixTableViewCell: UITableViewCell {

    
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var imageView3: UIImageView!
    
    @IBOutlet weak var imageView4: UIImageView!
    @IBOutlet weak var imageView5: UIImageView!
    @IBOutlet weak var imageView6: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        self.selectionStyle = UITableViewCellSelectionStyle.None

    }
    
}
