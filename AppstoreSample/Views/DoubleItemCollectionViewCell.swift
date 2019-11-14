//
//  DoubleItemCollectionViewCell.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/11/14.
//  Copyright © 2019 Nomad. All rights reserved.
//

import UIKit

class DoubleItemCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var appIconImageView: UIImageView!
	@IBOutlet weak var appNameLabel: UILabel!
	@IBOutlet weak var appCategoryLabel: UILabel!
	@IBOutlet weak var getButton: UIButton!
	
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
		appIconImageView.layer.cornerRadius = 10
		appIconImageView.clipsToBounds = true
		
		getButton.titleLabel?.textColor = UIColor.white
		getButton.backgroundColor = UIColor.init(netHex: 0x007AFF)
		getButton.layer.cornerRadius = 15
		getButton.clipsToBounds = true
		
    }

}
