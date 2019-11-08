//
//  AppItemCollectionViewCell.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/11/07.
//  Copyright © 2019 Nomad. All rights reserved.
//

import UIKit

class AppItemCollectionViewCell: UICollectionViewCell {
	
	@IBOutlet weak var appIconImage: UIImageView!
	@IBOutlet weak var appNameLabel: UILabel!
	@IBOutlet weak var appCategoryLabel: UILabel!
	@IBOutlet weak var getButton: UIButton!
	@IBOutlet weak var inAppPurchasesLabel: UILabel!
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		appIconImage.layer.cornerRadius = 10
		appIconImage.clipsToBounds = true
		
		getButton.backgroundColor = UIColor.blue //white
		getButton.titleLabel?.text = "GET" // or OPEN
		getButton.layer.cornerRadius = 10
		getButton.clipsToBounds = true
		
	}
	
}
