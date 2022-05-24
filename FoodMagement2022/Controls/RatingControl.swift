//
//  RatingControl.swift
//  FoodMagement2022
//
//  Created by CNTT on 4/12/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    //MARK: Properties
    @IBInspectable private var ratingValue:Int = 4{
        didSet{
            updateRatingButtonState()
        }
    }
    @IBInspectable private var soLuongSao:Int = 5{
        didSet{
            initialization()
        }
    }
    @IBInspectable private var kichThuocSao:CGSize = CGSize(width: 44.0, height: 44.0){
        didSet{
            initialization()
        }
    }
    private var ratingButton  = [UIButton]()
    private var activeButtonContraint = true
    //Mark: Contructors
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialization()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        initialization()
    }
    //Setup the RatingControl
    private func initialization(){
        //Clear the olds buttons
        for button in ratingButton{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButton.removeAll()
        //Load the image  star to the buttons
        let bundle = Bundle(for: type(of: self))
        let normalStar = UIImage(named: "normalStar", in: bundle, compatibleWith: self.traitCollection)
        let pressedStar = UIImage(named: "pressedStar", in: bundle, compatibleWith: self.traitCollection)
        let selectedStar = UIImage(named: "selectedStar", in: bundle, compatibleWith: self.traitCollection)
        //Tao rating buttons
        for _ in 0..<soLuongSao {
            let btnRating = UIButton()
            //Tao thuoc tinh cho button
            //btnRating.backgroundColor = UIColor.blue
            //Set the image star to the buttons
            btnRating.setImage(normalStar, for: .normal)
            btnRating.setImage(pressedStar, for: .highlighted)
            btnRating.setImage(selectedStar, for: .selected)
            btnRating.widthAnchor.constraint(equalToConstant: kichThuocSao.width).isActive = activeButtonContraint
            btnRating.heightAnchor.constraint(equalToConstant: kichThuocSao.height).isActive = activeButtonContraint
            //Bat su kien cho button
            btnRating.addTarget(self, action: #selector(ratingButtonPressed(button:)), for: .touchUpInside)
            //Them rating buttons vao StackView
            addArrangedSubview(btnRating)
            //Them button vao mang
            ratingButton.append(btnRating)
            }
        updateRatingButtonState()
    }
    //MARK: Event processing for rating button
    @objc private func ratingButtonPressed(button: UIButton){
        //print("Called")
        if let index = ratingButton.firstIndex(of: button){
            if index + 1 == ratingValue{
                ratingValue -= 1
            }
            else{
                ratingValue = index  + 1
            }
        }
        //print("Chi so cua button la: \(index!)")
        updateRatingButtonState()
    }
    private func updateRatingButtonState(){
        for (index, button) in ratingButton.enumerated(){
            button.isSelected = index<ratingValue
        }
    }
    //MARK: get and set of ratingValue
    func getRatingValue() -> Int {
        return ratingValue
    }
    func setRatingVaue(ratingValue:Int){
        self.ratingValue=ratingValue
    }
}
