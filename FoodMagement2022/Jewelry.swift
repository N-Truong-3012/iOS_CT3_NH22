//
//  Meal.swift
//  FoodMagement2022
//
//  Created by CNTT on 4/26/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit
class Jewelry {
    //MARK: Properties
    var jewelryName:String = ""
    var jewelryPrice:String = ""
    var jewelryQuantity:String = ""
    var jewelryImage:UIImage?
    
    //MARK: Contructor
    init?(jewelryName: String,jewelryImage:UIImage?,jewelryPrice:String,jewelryQuantity:String){
        if jewelryName.isEmpty{
            return nil
        }
        if jewelryPrice.isEmpty{
            return nil
        }
        if jewelryQuantity.isEmpty{
            return nil
        }
        self.jewelryName=jewelryName
        self.jewelryPrice=jewelryPrice
        self.jewelryQuantity=jewelryQuantity
        self.jewelryImage=jewelryImage
    }
}
