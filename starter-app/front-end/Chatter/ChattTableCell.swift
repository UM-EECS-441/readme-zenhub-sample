//
//  ChattTableCell.swift
//  Chatter
//
//  Created by SafeGuide on 9/29/18.
//  Copyright © 2018 SafeGuide. All rights reserved.
//

import Foundation
import UIKit

class ChattTableCell: UITableViewCell {
    
    @IBOutlet weak var timestampLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
