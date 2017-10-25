//
//  PhoneTableViewController.swift
//  Quiz Phone
//
//  Created by Abi Sayuti on 10/25/17.
//  Copyright © 2017 AbiSayuti. All rights reserved.
//

import UIKit

class PhoneTableViewController: UITableViewController {
    
 
    
    //deklarasi variable task sbg objek
    var PHONE: [Task] = [] // task ini diambil dari entiti yang sudah dibuat sebelumnya
    
    //deklarasi context untuk persistent container
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
   
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PHONE.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath) as! ResultTableViewCell

        // Configure the cell...
        
        
        //dekalrasi dataTask sebagai index dari tasks
        let dataTask = PHONE[indexPath.row]
        //mengambil data dengan attributes name_task
        if let phone = dataTask.name_phone {
            //menampilkan data ke label
            cell.LPhone.text = phone
        }
        if let TYPE = dataTask.type_phone {
            //menampilkan data ke label
            cell.LType.text = TYPE
        }
        if let BRAND = dataTask.brand_phone {
            //menampilkan data ke label
            cell.LBrand?.text = BRAND
        }
        
        

        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        //memanggil method getdata()
        getData()
        //memanggil reloadData
        tableView.reloadData()
        
        
        
    }
    
    
    func  getData() {
        
        //mengecek apakah ada error atau tidak
        do {
            //kondisi kalau tidak error
            //maka aka request download data
            PHONE = try context.fetch(Task.fetchRequest())
            
        }
        catch {
            //kondisi bila error fetch data
            print("Fetching failed")
            
        }
       
        
        
    }
    
    
    //menambahkan menu swipe bila edit data
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        //mengecek apakah swipe apabila editing style nya delete
        
        if editingStyle == .delete {
            let task = PHONE[indexPath.row]
            context.delete(task)
            //delete data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do {
                //retrieve data
                PHONE = try context.fetch(Task.fetchRequest())
                
                
            }
            catch {
                print("Fetching Failed")
            }
            
        }
        //load data lagi
        tableView.reloadData()
    
    
    
    }
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */



}
