//
//  JewelryCustomerTableViewController.swift
//  FoodMagement2022
//
//  Created by HoangThiHien on 5/21/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

class JewelryCustomerTableViewController: UITableViewController {
    //MARK:Properties
    var jewelrysCustomer = [Jewelry]()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Tao du lieu cho bang view controller
        let jewelryImage = UIImage(named: "daychuyen1")
        if let jewelry = Jewelry(jewelryName: "Day chuyen", jewelryImage: jewelryImage!, jewelryPrice: "220000", jewelryQuantity: "20") {
            jewelrysCustomer += [jewelry]
        }
        
        let jewelryImage2 = UIImage(named: "daychuyen2")
        if let jewelry = Jewelry(jewelryName: "Day chuyen da", jewelryImage: jewelryImage2!, jewelryPrice: "35000000", jewelryQuantity: "10") {
            jewelrysCustomer += [jewelry]
        }
        let jewelryImage3 = UIImage(named: "bongtai1")
        if let jewelry = Jewelry(jewelryName: "Bong tai", jewelryImage: jewelryImage3!, jewelryPrice: "15400000", jewelryQuantity: "41") {
            jewelrysCustomer += [jewelry]
        }
        let jewelryImage4 = UIImage(named: "nhan1")
        if let jewelry = Jewelry(jewelryName: "Nhan", jewelryImage: jewelryImage4!, jewelryPrice: "15050000", jewelryQuantity: "33") {
            jewelrysCustomer += [jewelry]
        }
        let jewelryImage5 = UIImage(named: "vongtay1")
        if let jewelry = Jewelry(jewelryName: "Vong tay", jewelryImage: jewelryImage5!, jewelryPrice: "30000000", jewelryQuantity: "15") {
            jewelrysCustomer += [jewelry]
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return jewelrysCustomer.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseCell = "JewelryCustomerTableViewCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseCell, for: indexPath) as? JewelryCustomerTableViewCell{
            //Lay du lieu tu datasource
            let jewelry = jewelrysCustomer[indexPath.row]
            cell.imgJCustomer.image=jewelry.jewelryImage
            cell.txtJCustomerName.text=jewelry.jewelryName
            cell.txtJCustomerPrice.text=jewelry.jewelryPrice
            cell.txtJCustomerQuantity.text=jewelry.jewelryQuantity
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
    
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
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
        if let selectedIndexPath = tableView.indexPathForSelectedRow{
            //Lay destination controller
            if let destinationController = segue.destination as? JewelryCustomerDetailViewController{
                //Truyen mon an sang MH2
                destinationController.jewelrys = jewelrysCustomer[selectedIndexPath.row]
            }
        }
    }
    
}
