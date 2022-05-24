//
//  OrderDetailViewController.swift
//  JewelryMagement2022
//
//  Created by HoangThiHien on 5/23/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

class OrderDetailViewController: UIViewController {
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtNameEmployee: UITextField!
    @IBOutlet weak var txtQuantity: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var edtNameCustomer: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        edtNameCustomer.text="Nguyen Trung Bao"
        txtAddress.text="Bac Ninh"
        txtPhone.text="0456218423"
        txtEmail.text="nguyenbao@gmail.com"
        txtQuantity.text="1"
        txtNameEmployee.text="Nguyen Thi Thao"

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
