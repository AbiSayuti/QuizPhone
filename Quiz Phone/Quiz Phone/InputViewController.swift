//
//  InputViewController.swift
//  Quiz Phone
//
//  Created by Abi Sayuti on 10/25/17.
//  Copyright © 2017 AbiSayuti. All rights reserved.
//

import UIKit

class InputViewController: UIViewController {
    
    
    @IBOutlet weak var etName: UITextField!
    @IBOutlet weak var etType: UITextField!
    @IBOutlet weak var etBrand: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnSaveDetail(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        //deklarasi task
        let NamePhone = Task(context: context)
        
        
        NamePhone.name_phone = etName.text
        
        NamePhone.type_phone = etType.text
        
        NamePhone.brand_phone = etBrand.text
        
        
        
        if etName.text == "" {
            //kondisi ketika kosong
            //tampil alert dialog
            
            let alertController = UIAlertController(title: "Warning",
                                                    message: "Name Phone Can't Be Empty", preferredStyle : .alert)
            alertController.addAction(UIAlertAction(title: "OK",
                                                    style: .default,handler: nil))
            present(alertController, animated: true, completion: nil)
        }else if etType.text == "" {
            //kondisi ketika kosong
            //tampil alert dialog
            
            let alertController = UIAlertController(title: "Warning",
                                                    message: "Type Phone Can't Be Empty", preferredStyle : .alert)
            alertController.addAction(UIAlertAction(title: "OK",
                                                    style: .default,handler: nil))
            present(alertController, animated: true, completion: nil)
        } else if etBrand.text == "" {
            //kondisi ketika kosong
            //tampil alert dialog
            
            let alertController = UIAlertController(title: "Warning",
                                                    message: "Brand Can't Be Empty", preferredStyle : .alert)
            alertController.addAction(UIAlertAction(title: "OK",
                                                    style: .default,handler: nil))
            present(alertController, animated: true, completion: nil)
        }else{
            //ketika kondisi teks task nya tidak kosong
            //data disimpan ke core data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            _ = navigationController?.popViewController(animated: true)
            
            //mencetak kalau data berhasil ditambahkan
            print("Data berhasil disimpan")
        
        
        
        
        
        
        
        
        
    }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
