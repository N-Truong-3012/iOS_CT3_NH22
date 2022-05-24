//
//  JewelryCustomerTableViewCell.swift
//  FoodMagement2022
//
//  Created by HoangThiHien on 5/21/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

class JewelryCustomerTableViewCell: UITableViewCell {

    @IBOutlet weak var txtJCustomerQuantity: UILabel!
    @IBOutlet weak var txtJCustomerPrice: UILabel!
    @IBOutlet weak var txtJCustomerName: UILabel!
    @IBOutlet weak var imgJCustomer: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
