//
//  OrderTableViewCell.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 15/12/2021.
//

import UIKit
import FirebaseAuth

// Class table view cell of order label :-

class OrderTableViewCell: UITableViewCell {
    @IBOutlet weak var orderLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
