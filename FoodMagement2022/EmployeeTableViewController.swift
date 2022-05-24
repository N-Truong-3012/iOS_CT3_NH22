//
//  EmployeeTableViewController.swift
//  FoodMagement2022
//
//  Created by HoangThiHien on 5/22/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

class EmployeeTableViewController: UITableViewController {
    //MARK:Properties
    var employees = [Employee]()
    enum NavigationType{
        case newEmployee
        case editEmployee
    }
    var navigationType:NavigationType = .newEmployee
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(gesture:)))
        swipeLeft.direction = .right
        self.view.addGestureRecognizer(swipeLeft)
        //Tao du lieu cho bang view controller
        let employeeImage = UIImage(named: "Hieu")
        if let employee = Employee(employeeName: "Nguyen Hieu", employeeCMND: "123456", employeePhone: "0123456", employeeAddress: "TPHCM", employeeImage: employeeImage!){
            employees += [employee]
        }
        let employeeImage2 = UIImage(named: "Thao")
        if let employee = Employee(employeeName: "Nguyen Thi Thao", employeeCMND: "1997854", employeePhone: "034579921", employeeAddress: "Quang Tri", employeeImage: employeeImage2!){
            employees += [employee]
        }
        let employeeImage3 = UIImage(named: "Trung")
        if let employee = Employee(employeeName: "Ho Duc Trung", employeeCMND: "187542621", employeePhone: "0378245312", employeeAddress: "Hue", employeeImage: employeeImage3!){
            employees += [employee]
        }
        //Them button Edit o navigationBar
        navigationItem.leftBarButtonItem = editButtonItem
    }
    @objc func swipeFunc(gesture:UISwipeGestureRecognizer){
        if gesture.direction == .right{
            performSegue(withIdentifier: "Right", sender: self)
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return employees.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseCell = "EmployeeTableViewCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseCell, for: indexPath) as? EmployeeTableViewCell{
            //Lay du lieu tu datasource
            let employee = employees[indexPath.row]
            cell.imgEmployee.image=employee.employeeImage
            cell.lblNameEmployee.text=employee.employeeName
            cell.lblCMNDEmployee.text=employee.employeeCMND
            cell.lblPhoneEmployee.text=employee.employeePhone
            cell.lblAddressEmployee.text=employee.employeeAddress
            return cell
        }
        else{
            fatalError("Khong the tao duoc cell!")
        }
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //Xoa trong datasource
            employees.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Lay IndexPath (vi tri) jewelry da chon
        if let identifier = segue.identifier{
            switch identifier {
            case "newEmployee":
                navigationType = .newEmployee
                if let destinationController = segue.destination as? EmployeeDetailViewController{
                    //Danh dau duong di newEmployee hay newEmployee cho MH2
                    destinationController.navigationType = .newEmployee
                    
                }
            case "editEmployee":
                navigationType = .editEmployee
                //Lay IndexPath (vi tri) meal da chon
                if let selectedIndexPath = tableView.indexPathForSelectedRow{
                    //Lay destination controller
                    if let destinationController = segue.destination as? EmployeeDetailViewController{
                        //Truyen nhan vien sang MH2
                        destinationController.employee = employees[selectedIndexPath.row]
                        //Danh dau duong di editEmployee hay newMeal cho MH2
                        destinationController.navigationType = .editEmployee
                        
                    }
                }
                
            default:
                break
            }
        }
    }
    
    //Create unWind to return back from EmployeeDetailController
    @IBAction func unWindFromEmployeeDetailController(segue:UIStoryboardSegue){
        //Get source controller
        if let sourceController = segue.source as? EmployeeDetailViewController{
            if let employee = sourceController.employee{
                //Sua employee or them employee
                switch navigationType{
                case .newEmployee:
                    //Them mon an vao dataSource
                    employees += [employee]
                    //Them trang suc vao table view
                    let newIndexPath = IndexPath(row: employees.count-1, section: 0)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                case .editEmployee:
                    if let selectedIndexPath = tableView.indexPathForSelectedRow{
                        //Cap nhat trong data source
                        employees[selectedIndexPath.row]=employee
                        //Reload the selected meal in table
                        tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
                    }
                    
                }
                
            }
        }
    }

}
