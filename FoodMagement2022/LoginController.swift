//
//  LoginController.swift
//  FoodMagement2022
//
//  Created by HoangThiHien on 5/21/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

class LoginController: UIViewController {
    
    @IBAction func btnRegister(_ sender: Any) {
        print("Chuyen man hinh")
        let src = storyboard?.instantiateViewController(withIdentifier: "Register") as! RegisterViewController
        
        //Chuyen man hinh co nav
        navigationController?.pushViewController(src, animated: true)
        
    }
    @IBOutlet weak var txttaiKhoan: UITextField!
    @IBOutlet weak var txtMatKhau: UITextField!
    @IBAction func btnLogin(_ sender: Any) {
        //Khai bao bien:
        var user:String=""
        var pass:String=""
        //Lay du lieu:
        user=txttaiKhoan.text!
        pass=txtMatKhau.text!
        //Kiem tra
        
        if user.count==0{
            //Khai bao doi tuong
            let alert = UIAlertController(title: "Thong bao", message: "Please enter Username!", preferredStyle: .alert)
            //Tao 1 button
            let btnOK = UIAlertAction(title: "Dong", style: .default, handler: nil)
            alert.addAction(btnOK)
            //Hien thi thong bao
            self.present(alert, animated: true, completion: nil)
            //txttaiKhoan.becomeFirstResponder()
            return
        }
        else if pass.count==0{
            let alert = UIAlertController(title: "Thong bao", message: "Please enter Password!", preferredStyle: .alert)
            //Tao 1 button
            let btnOK = UIAlertAction(title: "Dong", style: .default, handler: nil)
            alert.addAction(btnOK)
            //Hien thi thong bao
            self.present(alert, animated: true, completion: nil)
            //txtMatKhau.becomeFirstResponder()
            return
        }
        else if user=="adhien" && pass=="12345"{
            txtMatKhau.text=""
            txttaiKhoan.text=""
            let src = storyboard?.instantiateViewController(withIdentifier: "AdminFunction") as! AdminFunctionController
            
            //Chuyen man hinh co nav
            navigationController?.pushViewController(src, animated: true)
            
        }
        else if user=="hien" && pass=="12345"{
            txtMatKhau.text=""
            txttaiKhoan.text=""
            let src = storyboard?.instantiateViewController(withIdentifier: "JewelryCustomer") as! JewelryCustomerTableViewController
            
            //Chuyen man hinh co nav
            navigationController?.pushViewController(src, animated: true)
            
        }
        else if user=="NV1" && pass=="224466"{
            txtMatKhau.text=""
            txttaiKhoan.text=""
            let src = storyboard?.instantiateViewController(withIdentifier: "JewelryEmployeeTableViewController") as! JewelryEmployeeTableViewController
            
            //Chuyen man hinh co nav
            navigationController?.pushViewController(src, animated: true)
            
        }
        else{
            let alert = UIAlertController(title: "Thong bao", message: "Username or Password is incorrect", preferredStyle: .alert)
            //Tao 1 button
            let btnOK = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(btnOK)
            //Hien thi thong bao
            self.present(alert, animated: true, completion: nil)
            txtMatKhau.text=""
            txttaiKhoan.text=""
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
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
