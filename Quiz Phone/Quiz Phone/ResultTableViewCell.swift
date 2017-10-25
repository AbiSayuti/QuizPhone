//
//  ResultTableViewCell.swift
//  Quiz Phone
//
//  Created by Abi Sayuti on 10/25/17.
//  Copyright © 2017 AbiSayuti. All rights reserved.
//

import UIKit

class ResultTableViewCell: UITableViewCell {

    @IBOutlet weak var LPhone: UILabel!
    @IBOutlet weak var LType: UILabel!
    @IBOutlet weak var LBrand: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
