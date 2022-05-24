//
//  JewelryViewCell.swift
//  FoodMagement2022
//
//  Created by HoangThiHien on 5/21/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

class JewelryViewCell: UITableViewCell {

    
    @IBOutlet weak var txtJewelryName: UILabel!
    @IBOutlet weak var txtJewelryPrice: UILabel!
    @IBOutlet weak var txtJewelryQuantity: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
