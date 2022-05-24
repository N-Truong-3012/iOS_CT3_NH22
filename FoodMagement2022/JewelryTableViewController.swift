//
//  MealTableViewController.swift
//  FoodMagement2022
//
//  Created by CNTT on 4/19/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

class JewelryTableViewController: UITableViewController {
    //MARK:Properties
    var jewelrys = [Jewelry]()
    enum NavigationType{
        case newJewelry
        case editJewelry
    }
    var navigationType:NavigationType = .editJewelry
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swipeFunc(gesture:)))
        swipeLeft.direction = .right
        self.view.addGestureRecognizer(swipeLeft)
        //Tao du lieu cho bang view controller
        let jewelryImage = UIImage(named: "daychuyen1")
        if let jewelry = Jewelry(jewelryName: "Day chuyen", jewelryImage: jewelryImage!, jewelryPrice: "220000", jewelryQuantity: "20") {
            jewelrys += [jewelry]
        }
 
        let jewelryImage2 = UIImage(named: "daychuyen2")
        if let jewelry = Jewelry(jewelryName: "Day chuyen da", jewelryImage: jewelryImage2!, jewelryPrice: "35000000", jewelryQuantity: "10") {
            jewelrys += [jewelry]
        }
        let jewelryImage3 = UIImage(named: "bongtai1")
        if let jewelry = Jewelry(jewelryName: "Bong tai", jewelryImage: jewelryImage3!, jewelryPrice: "15400000", jewelryQuantity: "41") {
            jewelrys += [jewelry]
        }
        let jewelryImage4 = UIImage(named: "nhan1")
        if let jewelry = Jewelry(jewelryName: "Nhan", jewelryImage: jewelryImage4!, jewelryPrice: "15050000", jewelryQuantity: "33") {
            jewelrys += [jewelry]
        }
        let jewelryImage5 = UIImage(named: "vongtay1")
        if let jewelry = Jewelry(jewelryName: "Vong tay", jewelryImage: jewelryImage5!, jewelryPrice: "30000000", jewelryQuantity: "15") {
            jewelrys += [jewelry]
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
        return jewelrys.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseCell = "JewelryTableViewCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseCell, for: indexPath) as? JewelryTableViewCell{
            //Lay du lieu tu datasource
            let jewelry = jewelrys[indexPath.row]
            cell.ivJewelry.image=jewelry.jewelryImage
            cell.txtJewelryName.text=jewelry.jewelryName
            cell.txtJewelryPrice.text=jewelry.jewelryPrice
            cell.txtJewelryQuantity.text=jewelry.jewelryQuantity
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
            //Xoa trong data source
            jewelrys.remove(at: indexPath.row)
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
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a litte preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier{
            switch identifier {
            case "newJewelry":
                navigationType = .newJewelry
                if let destinationController = segue.destination as? JewelryDetailController{
                    //Danh dau duong di newJewelry hay newMeal cho MH2
                    destinationController.navigationType = .newJewelry

                }
            case "editJewelry":
                navigationType = .editJewelry
                //Lay IndexPath (vi tri) meal da chon
                if let selectedIndexPath = tableView.indexPathForSelectedRow{
                    //Lay destination controller
                    if let destinationController = segue.destination as? JewelryDetailController{
                        //Truyen mon an sang MH2
                        destinationController.jewelry = jewelrys[selectedIndexPath.row]
                        //Danh dau duong di editMeal hay newMeal cho MH2
                        destinationController.navigationType = .editJewelry

                    }
                }

            default:
                break
            }
        }
    }
    //Create unWind to return back from MealDetailController
    @IBAction func unWindFromJewelryDetailController(segue:UIStoryboardSegue){
        //Get source controller
        if let sourceController = segue.source as? JewelryDetailController{
            if let jewelry = sourceController.jewelry{
                //Sua jewelry or them jewelry
                switch navigationType{
                case .newJewelry:
                    //Them jewelry vao dataSource
                    jewelrys += [jewelry]
                    //Them trang suc vao table view
                    let newIndexPath = IndexPath(row: jewelrys.count-1, section: 0)
                    tableView.insertRows(at: [newIndexPath], with: .automatic)
                case .editJewelry:
                    if let selectedIndexPath = tableView.indexPathForSelectedRow{
                        //Cap nhat trong data source
                        jewelrys[selectedIndexPath.row]=jewelry
                        //Reload the selected meal in table
                        tableView.reloadRows(at: [selectedIndexPath], with: .automatic)
                    }

                }

            }
        }
    }
    
}
