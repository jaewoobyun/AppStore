//
//  TodayItemCellTableViewCell.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/10/23.
//  Copyright © 2019 Nomad. All rights reserved.
//

import UIKit

class TodayItemCell: UITableViewCell {
	
	@IBOutlet weak var customImageView: UIImageView!
	
	@IBOutlet weak var RecommendLabel: UILabel!
	
	@IBOutlet weak var TitleLabel: UILabel!
	
	
	override func awakeFromNib() {
		super.awakeFromNib()
		customImageView.layer.cornerRadius = 20
		customImageView.clipsToBounds = true
		
		
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
		print("selected")
	}
	
}
