//
//  Employee.swift
//  FoodMagement2022
//
//  Created by HoangThiHien on 5/22/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit
class Employee {
    //MARK: Properties
    var employeeName:String = ""
    var employeeCMND:String = ""
    var employeePhone:String = ""
    var employeeAddress:String = " "
    var employeeImage:UIImage?
    
    //MARK: Contructor
    init?(employeeName: String,employeeCMND:String,employeePhone:String,employeeAddress:String,employeeImage:UIImage?){
        if employeeName.isEmpty||employeeCMND.isEmpty||employeePhone.isEmpty||employeeName.isEmpty{
            return nil
        }
        self.employeeName = employeeName
        self.employeeCMND = employeeCMND
        self.employeePhone = employeePhone
        self.employeeAddress = employeeAddress
        self.employeeImage = employeeImage
    }
}
