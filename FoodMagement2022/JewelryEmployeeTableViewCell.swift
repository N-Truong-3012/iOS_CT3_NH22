//
//  JewelryEmployeeTableViewCell.swift
//  JewelryMagement2022
//
//  Created by HoangThiHien on 5/23/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

class JewelryEmployeeTableViewCell: UITableViewCell {

    @IBOutlet weak var lblJewelryPrice: UILabel!
    @IBOutlet weak var lblJewelryName: UILabel!
    @IBOutlet weak var lblJewelryQuantity: UILabel!
    @IBOutlet weak var imgJewelry: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
