//
//  JewelryCustomerDetailViewController.swift
//  FoodMagement2022
//
//  Created by HoangThiHien on 5/22/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

class JewelryCustomerDetailViewController: UIViewController {

    @IBOutlet weak var lblJCQuantity: UILabel!
    @IBOutlet weak var lblJCPrice: UILabel!
    @IBOutlet weak var lblJCName: UILabel!
    @IBOutlet weak var imgJCustomer: UIImageView!
    //Bien thanh phan
    var jewelrys:Jewelry?
    override func viewDidLoad() {
        super.viewDidLoad()
        //Lay edtJewelry tu JewelryCustomerTableViewController
        if let jewelry = jewelrys{
            navigationItem.title=jewelry.jewelryName
            lblJCName.text = jewelry.jewelryName
            lblJCPrice.text = jewelry.jewelryPrice
            lblJCQuantity.text = jewelry.jewelryQuantity
            imgJCustomer.image=jewelry.jewelryImage
        }
    }
    
    //MARK: TextField 's Delegate Function
    //An ban phim
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        lblJCName.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //Hien thi ten len navigation
        navigationItem.title = lblJCName.text!
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
