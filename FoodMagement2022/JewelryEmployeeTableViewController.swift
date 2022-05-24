//
//  JewelryEmployeeTableViewController.swift
//  JewelryMagement2022
//
//  Created by HoangThiHien on 5/23/22.
//  Copyright © 2022 fit.tdc. All rights reserved.
//

import UIKit

class JewelryEmployeeTableViewController: UITableViewController {
    //MARK:Properties
    var jewelrys = [Jewelry]()
    override func viewDidLoad() {
        super.viewDidLoad()

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
        let reuseCell = "JewelryEmployeeTableViewCell"
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseCell, for: indexPath) as? JewelryEmployeeTableViewCell{
            //Lay du lieu tu datasource
            let jewelry = jewelrys[indexPath.row]
            cell.imgJewelry.image=jewelry.jewelryImage
            cell.lblJewelryName.text=jewelry.jewelryName
            cell.lblJewelryPrice.text=jewelry.jewelryPrice
            cell.lblJewelryQuantity.text=jewelry.jewelryQuantity
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

}
