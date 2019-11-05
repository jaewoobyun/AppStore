//
//  ListCell.swift
//  AppstoreSample
//
//  Created by Nomad on 2019/10/24.
//  Copyright © 2019 Nomad. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
	
	@IBOutlet weak var themeLabel: UILabel!
	@IBOutlet weak var largeTextLabel: UILabel!
	
	//first app item
	@IBOutlet weak var firstAppIcon: UIImageView!
	@IBOutlet weak var firstAppName: UILabel!
	@IBOutlet weak var firstAppGenre: UILabel!
	@IBOutlet weak var firstAppDownloadButton: UIButton!
	//second app item
	@IBOutlet weak var secondAppIcon: UIImageView!
	@IBOutlet weak var secondAppName: UILabel!
	@IBOutlet weak var secondAppGenre: UILabel!
	@IBOutlet weak var secondAppDownloadButton: UIButton!
	//third app item
	@IBOutlet weak var thirdAppIcon: UIImageView!
	@IBOutlet weak var thirdAppName: UILabel!
	@IBOutlet weak var thirdAppGenre: UILabel!
	@IBOutlet weak var thirdAppDownloadButton: UIButton!
	//fourth app item
	@IBOutlet weak var fourthAppIcon: UIImageView!
	@IBOutlet weak var fourthAppName: UILabel!
	@IBOutlet weak var fourthAppGenre: UILabel!
	@IBOutlet weak var fourthAppDownloadButton: UIButton!
	//fifth app item
	@IBOutlet weak var fifthAppIcon: UIImageView!
	@IBOutlet weak var fifthAppName: UILabel!
	@IBOutlet weak var fifthAppGenre: UILabel!
	@IBOutlet weak var fifthAppDownloadButton: UIButton!
	
	
	static var nib: UINib {
		return UINib(nibName: String(describing: self), bundle: nil)
	}
	
	override func awakeFromNib() {
		super.awakeFromNib()
		
		//Name
		firstAppName.text = "firstApp"
		secondAppName.text = "secondApp"
		thirdAppName.text = "thirdApp"
		fourthAppName.text = "fourthApp"
		fifthAppName.text = "fifthApp"
		
		//Genre
		firstAppGenre.text = "firstAppGenre"
		secondAppGenre.text = "secondAppGenre"
		thirdAppGenre.text = "thirdAppGenre"
		fourthAppGenre.text = "fourthAppGrenre"
		
		//Icon
		firstAppIcon.image = UIImage(named: "profile")
		firstAppIcon.layer.cornerRadius = 10
		firstAppIcon.clipsToBounds = true
		
		secondAppIcon.image = UIImage(named: "profile")
		secondAppIcon.layer.cornerRadius = 10
		secondAppIcon.clipsToBounds = true
		
		thirdAppIcon.image = UIImage(named: "profile")
		thirdAppIcon.layer.cornerRadius = 10
		thirdAppIcon.clipsToBounds = true
		
		fourthAppIcon.image = UIImage(named: "profile")
		fourthAppIcon.layer.cornerRadius = 10
		fourthAppIcon.clipsToBounds = true
		
		fifthAppIcon.image = UIImage(named: "profile")
		fifthAppIcon.layer.cornerRadius = 10
		fifthAppIcon.clipsToBounds = true
		
		//Button
		firstAppDownloadButton.backgroundColor = UIColor.gray
		
		firstAppDownloadButton.layer.cornerRadius = 10
		firstAppDownloadButton.clipsToBounds = true
		
		
		secondAppDownloadButton.layer.cornerRadius = 10
		secondAppDownloadButton.clipsToBounds = true
		thirdAppDownloadButton.layer.cornerRadius = 10
		thirdAppDownloadButton.clipsToBounds = true
		fourthAppDownloadButton.layer.cornerRadius = 10
		fourthAppDownloadButton.clipsToBounds = true
		fifthAppDownloadButton.layer.cornerRadius = 10
		fifthAppDownloadButton.clipsToBounds = true
		
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
