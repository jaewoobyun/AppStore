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
		
		getButton.backgroundColor = UIColor.init(netHex: 0x007AFF)
		getButton.titleLabel?.text = "GET" // or OPEN
		getButton.layer.cornerRadius = 10
		getButton.clipsToBounds = true
		inAppPurchasesLabel.textColor = UIColor.lightGray
	}
	
	func setCellLayer() {
		appIconImage.layer.cornerRadius = 10
		appIconImage.clipsToBounds = true
		getButton.layer.cornerRadius = 15
		getButton.clipsToBounds = true
	}
	
	func setCellData(_ data: Entry) {
		appIconImage.downloaded(from: data.imImage[0].label)
		appNameLabel.text = data.imName.label
		appCategoryLabel.text = data.category.attributes.term
		getButton.titleLabel?.text = (data.imPrice.label)
	}
	
}
