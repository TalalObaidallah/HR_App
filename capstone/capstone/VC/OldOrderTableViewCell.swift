//
//  OldOrderTableViewCell.swift
//  capstone
//
//  Created by طلال عبيدالله دعيع القلادي on 02/01/2022.
//

import UIKit
import FirebaseAuth

class OldOrderTableViewCell: UITableViewCell {

    @IBOutlet weak var oldOrderLabel: UILabel!
    @IBOutlet weak var oldOrderImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
