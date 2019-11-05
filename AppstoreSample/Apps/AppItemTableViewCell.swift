//
//  AppItemTableViewCell.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/10/28.
//  Copyright © 2019 Nomad. All rights reserved.
//

import UIKit

class AppItemTableViewCell: UITableViewCell {
	
	static var nib: UINib {
		return UINib(nibName: String(describing: self), bundle: nil)
	}

	@IBOutlet weak var appIcon: UIImageView!
	@IBOutlet weak var numberLabel: UILabel!
	@IBOutlet weak var appName: UILabel!
	@IBOutlet weak var appGenre: UILabel!
	@IBOutlet weak var downloadButton: UIButton!
	
	
	
	
	override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		
		appIcon.layer.cornerRadius = 10
		appIcon.clipsToBounds = true
		
		downloadButton.backgroundColor = UIColor.lightGray
		downloadButton.layer.cornerRadius = 10
		downloadButton.clipsToBounds = true
		
		
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
