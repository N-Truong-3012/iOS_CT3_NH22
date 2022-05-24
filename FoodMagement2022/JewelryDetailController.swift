//
//  ViewController.swift
//  FoodMagement2022
//
//  Created by CNTT on 4/5/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

class JewelryDetailController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    //MARK: Properties
    @IBOutlet weak var edtJewelryQuantity: UITextField!
    @IBOutlet weak var btnSave: UIBarButtonItem!
    @IBOutlet weak var imgJewelry: UIImageView!
    @IBOutlet weak var edtJewelryPrice: UITextField!
    @IBOutlet weak var edtJewelryName: UITextField!
    //Bien thanh phan
    var jewelry:Jewelry?
    
    enum NavigationType{
        case newJewelry
        case editJewelry
    }
    var navigationType:NavigationType = .editJewelry
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Delegation of textfield
        edtJewelryName.delegate = self
        //Lay Jewelry tu JewelryTableViewController
        if let jewelry = jewelry{
            navigationItem.title=jewelry.jewelryName
            edtJewelryName.text = jewelry.jewelryName
            edtJewelryPrice.text = jewelry.jewelryPrice
            edtJewelryQuantity.text = jewelry.jewelryQuantity
            imgJewelry.image=jewelry.jewelryImage
        }
        
    }
    
    //MARK: TextField 's Delegate Function
    //An ban phim
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        edtJewelryName.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //Hien thi ten len navigation
        navigationItem.title = edtJewelryName.text!
    }
    
    //MARK: Image processing
    
    @IBAction func ImgProcessing(_ sender: UITapGestureRecognizer) {
        //An ban phim
        edtJewelryName.resignFirstResponder()
        //Khoi tao mot doi tuong ImagePickerController
        let imagePickerController = UIImagePickerController()
        //Setup the propertise for the imagePickerController
        imagePickerController.sourceType = .photoLibrary
        //Delegation of ImagePickerController: Uy quyen
        imagePickerController.delegate = self
        //Hien thi doi tuong imagePickerController
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    
    //MARK: ImagePickerController 's Delegate Functions
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Chuyen ve man hinh truoc: animated hieu ung chuyen, completion ham co the goi (VD"Ban co muon thoat?)
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //Lay anh tu imagePickerController
        if let selectedImage = info[.originalImage] as? UIImage{
            //Thay anh da chon
            imgJewelry.image = selectedImage
        }
        //An man hinh imagePickerController
        dismiss(animated: true, completion: nil)
    }
    //MARK: Navigration Actions
    @IBAction func btnCancel(_ sender: UIBarButtonItem) {
        switch navigationType {
        case .newJewelry:
            //An MH2
            dismiss(animated: true, completion: nil)
        case .editJewelry:
            //Lay navigationController (QL Stack)
            if let navigationController = navigationController{
                navigationController.popViewController(animated: true)
            }
        }
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let btnSender = sender as? UIBarButtonItem {
            if btnSender === btnSave{
                //Create the new jewelry to transfer to the jewelrylist
                let name = edtJewelryName.text ?? ""
                let price = edtJewelryPrice.text ?? ""
                let quantity = edtJewelryQuantity.text ?? ""
                let image=imgJewelry.image
                jewelry = Jewelry(jewelryName: name, jewelryImage: image, jewelryPrice: price, jewelryQuantity: quantity)
                
            }
        }
    }
}

