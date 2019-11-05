//
//  RecommendCell.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/10/25.
//  Copyright © 2019 Nomad. All rights reserved.
//

import UIKit

class RecommendCell: UITableViewCell {
	
	@IBOutlet weak var appImage: UIImageView!
	
	@IBOutlet weak var recommendTitle: UILabel!
	
	@IBOutlet weak var appIcon: UIImageView!
	@IBOutlet weak var appName: UILabel!
	@IBOutlet weak var appDescription: UILabel!
	@IBOutlet weak var appDownloadButton: UIButton!
	
	
	static var nib: UINib {
		return UINib(nibName: String(describing: self), bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		appImage.image = UIImage(named: "contentImage")
		
		recommendTitle.text = "오늘의 게임"
		recommendTitle.adjustsFontSizeToFitWidth = true
		recommendTitle.font = UIFont.boldSystemFont(ofSize: 50)
		recommendTitle.textColor = UIColor.white
		
		appIcon.image = UIImage(named: "profile")
		appIcon.layer.cornerRadius = 10
		appIcon.clipsToBounds = true
		
		appName.text = "New app name"
		appDescription.text = "New app description"
		
		appDownloadButton.layer.cornerRadius = 10
		appDownloadButton.clipsToBounds = true
		
		
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
		contentView.layer.cornerRadius = 20
		contentView.clipsToBounds = true
		
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		
		// Configure the view for the selected state
	}
	
}
