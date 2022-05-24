//
//  EmployeeDetailViewController.swift
//  FoodMagement2022
//
//  Created by HoangThiHien on 5/22/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

class EmployeeDetailViewController: UIViewController, UIImagePickerControllerDelegate , UITextFieldDelegate, UINavigationControllerDelegate {
        //MARK: Properties
    @IBOutlet weak var btnSave: UIBarButtonItem!
    @IBOutlet weak var txtEmployeeAddress: UITextField!
    @IBOutlet weak var txtEmployeePhone: UITextField!
    @IBOutlet weak var txtEmployeeCMND: UITextField!
    @IBOutlet weak var txtEmployeeName: UITextField!
    @IBOutlet weak var imgEmployee: UIImageView!
    //Bien thanh phan
    var employee:Employee?
    enum NavigationType{
        case newEmployee
        case editEmployee
    }
    var navigationType:NavigationType = .newEmployee
    override func viewDidLoad() {
        super.viewDidLoad()
        //Delegation of textfield
        txtEmployeeName.delegate = self
                //Lay employee tu JewelryTableViewController
        if let employee = employee{
            navigationItem.title=employee.employeeName
            txtEmployeeName.text = employee.employeeName
            txtEmployeeCMND.text = employee.employeeCMND
            txtEmployeePhone.text = employee.employeePhone
            txtEmployeeAddress.text = employee.employeeAddress
            imgEmployee.image=employee.employeeImage
        }
    }
    //MARK: TextField 's Delegate Function
    //An ban phim
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtEmployeeName.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        //Hien thi ten len navigation
        navigationItem.title = txtEmployeeName.text!
    }
    //MARK: Image processing

    
    @IBAction func ImgProcessing(_ sender: UITapGestureRecognizer) {
        //An ban phim
        txtEmployeeName.resignFirstResponder()
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
            imgEmployee.image = selectedImage
        }
        //An man hinh imagePickerController
        dismiss(animated: true, completion: nil)
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
    @IBAction func btnCancel(_ sender: Any) {
        switch navigationType {
        case .newEmployee:
            //An MH2
            dismiss(animated: true, completion: nil)
        case .editEmployee:
            //Lay navigationController (QL Stack)
            if let navigationController = navigationController{
                navigationController.popViewController(animated: true)
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let btnSender = sender as? UIBarButtonItem {

            if btnSender === btnSave{
                //Create the new employee to transfer to the emloyeelist
                let name = txtEmployeeName.text ?? ""
                let cmnd = txtEmployeeCMND.text ?? ""
                let phone = txtEmployeePhone.text ?? ""
                let address = txtEmployeeAddress.text ?? ""
                let image=imgEmployee.image
                employee = Employee(employeeName: name, employeeCMND: cmnd, employeePhone: phone, employeeAddress: address, employeeImage: image)
                
            }
        }
    }
    
}
