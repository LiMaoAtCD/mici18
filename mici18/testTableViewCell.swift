//
//  testTableViewCell.swift
//  mici18
//
//  Created by AlienLi on 15/1/5.
//  Copyright (c) 2015年 ALN. All rights reserved.
//

import UIKit

class testTableViewCell: UITableViewCell {

    @IBOutlet weak var exchangeCodeTextField: UITextField!
    
    @IBOutlet weak var imeiTextField: UITextField!
    
    @IBOutlet weak var getGiftButton: UIButton!
    
    @IBOutlet weak var findIMEIbutton: UIButton!
    
    @IBOutlet weak var activitiesDeclareButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.selectionStyle = UITableViewCellSelectionStyle.None
        // Configure the view for the selected state
    }

}
