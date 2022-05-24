//
//  EmployeeTableViewCell.swift
//  FoodMagement2022
//
//  Created by HoangThiHien on 5/22/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    @IBOutlet weak var lblNameEmployee: UILabel!
    @IBOutlet weak var lblPhoneEmployee: UILabel!
    @IBOutlet weak var lblAddressEmployee: UILabel!
    @IBOutlet weak var lblCMNDEmployee: UILabel!
    @IBOutlet weak var imgEmployee: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
